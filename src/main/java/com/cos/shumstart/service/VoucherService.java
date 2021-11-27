package com.cos.shumstart.service;

import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.domain.voucher.VoucherRepository;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import com.cos.shumstart.web.dto.VoucherDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@EnableScheduling
@RequiredArgsConstructor
@Service
public class VoucherService {

    private final UserRepository userRepository;
    private final VoucherRepository voucherRepository;

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    @Autowired
    private DataSource dataSource;

    public Voucher 이용권정보(int userId) {

        List<Voucher> voucherEntityList =  voucherRepository.findByUserId(userId);

        Voucher voucherEntity = new Voucher();

        for (int i = 0; i < voucherEntityList.size(); i++) {
            Voucher voucher = voucherEntityList.get(i);

            if(voucher.getActivation() == true) {
                voucherEntity = voucher;
            }
        }

        return voucherEntity;
    }

    public Voucher 연체된이용권정보(int userId) {

        List<Voucher> voucherEntityList =  voucherRepository.findByUserId(userId);

        Voucher voucherEntity = new Voucher();


        //맨 마지막으로 빌렸던게 연체된 이용권정보일 것이다.
        voucherEntity=voucherEntityList.get(voucherEntityList.size()-1);
        return voucherEntity;
    }

    @Transactional
    public Voucher 이용권구매(int userId, String ticketType) {

        User userEntity = userRepository.findById(userId);

        Voucher qrcode = new Voucher();
        qrcode.setReservationCode(createReservationCode());
        qrcode.setUser(userEntity);
        qrcode.setTicketType(ticketType);
        qrcode.setActivation(true);

        userRepository.updateHaveTicket(true, userId);

        return voucherRepository.save(qrcode);
    }

    //예약번호 임의로 생성할려고
    public String createReservationCode(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str="";

        int idx=0;
        for(int i=0;i<10;i++){
            idx=(int)(charSet.length*Math.random());
            str+=charSet[idx];
        }
        return  str;
    }

    @Transactional//연체료 부과후에는 다시 연체료를 없애준다.
    public void 연체료삭제(int userId){
        User user=userRepository.findById(userId);
        user.setLateFee(0);
    }

    @Scheduled(fixedRateString = "1000")
    @Transactional
    public void 이용권기간만료() {
        ArrayList<VoucherDto> list = new ArrayList<>();
        try {
            String sql = "select * from voucher";
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                VoucherDto dto = new VoucherDto();
                dto.setId(rs.getInt("id"));
                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("getDataAll err : " + e);
        }finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                // TODO: handle exception
            }
        }

        for(int i = 0; i < list.size(); i++) {
            List<Voucher> voucherEntityList = voucherRepository.findById(list.get(i).getId());

            Voucher voucherEntity = new Voucher();

            for (int j = 0; j < voucherEntityList.size(); j++) {
                Voucher voucher = voucherEntityList.get(j);

                if(voucher.getActivation() == true) {
                    voucherEntity = voucher;
                }
            }

            LocalDateTime voucherStartTime = voucherEntity.getVoucherStartDate();
            if(voucherStartTime != null) {
                LocalDateTime returnTime = voucherEntity.getVoucherStartDate().plusDays(1);
                int userId = voucherEntity.getUser().getId();

                if(returnTime.isBefore(LocalDateTime.now())) {
                    voucherRepository.updateVoucherEndDate(LocalDateTime.now(), voucherEntity.getId());
                    voucherRepository.updateActivation(false, voucherEntity.getId());
                    userRepository.updateHaveTicket(false, userId);
                }
            }
        }
    }

    @Scheduled(fixedRateString = "5000")
    @Transactional
    public void 연체료부과() {
        ArrayList<Integer> userIdList = new ArrayList<>();
        ArrayList<Double> userLateFeeStackList = new ArrayList<>();

        try {
            String sql = "select * from user";
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                userIdList.add(rs.getInt("id"));
                userLateFeeStackList.add(rs.getDouble("LateFeeStack"));
            }
        } catch (Exception e) {
            System.out.println("getDataAll err : " + e);
        }finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                // TODO: handle exception
            }
        }

        for(int i = 0; i < userIdList.size(); i++) {
            User userEntity = userRepository.findById(userIdList.get(i).intValue());
            double lateFeeStack = userLateFeeStackList.get(i);

            if(userEntity.isHaveTicket() == false && userEntity.isState() == true) {
                int lateFee = userEntity.getLateFee();
                if(lateFeeStack >= 500) {
                    userRepository.updateLateFee(lateFee + 500, userEntity.getId());
                    lateFeeStack = 0;
                }

                lateFeeStack += 0.695;
                userRepository.updateLateFeeStack(lateFeeStack, userEntity.getId());
            }
        }
    }
}
