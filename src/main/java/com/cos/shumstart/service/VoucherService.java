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

@EnableScheduling
@RequiredArgsConstructor
@Service
public class VoucherService {

    private final UserRepository userRepository;
    private final VoucherRepository voucherRepository;

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private double lateFeeStack;

    @Autowired
    private DataSource dataSource;

    public Voucher 이용권정보(int userId) {
        return voucherRepository.findByUserId(userId);
    }

    @Transactional
    public Voucher 이용권구매(int userId, String ticketType) {

        User userEntity = userRepository.findById(userId);

        Voucher qrcode = new Voucher();
        qrcode.setUser(userEntity);
        qrcode.setTicketType(ticketType);

        userRepository.updateHaveTicket(true, userId);

        return voucherRepository.save(qrcode);
    }

    @Scheduled(fixedRateString = "5000")
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
            Voucher voucherEntity = voucherRepository.findById(list.get(i).getId());

            LocalDateTime voucherStartTime = voucherEntity.getVoucherStartDate();
            if(voucherStartTime != null) {
                LocalDateTime returnTime = voucherEntity.getVoucherStartDate().plusDays(1);
                int userId = voucherEntity.getUser().getId();

                if(returnTime.isBefore(LocalDateTime.now())) {
                    voucherRepository.voucherDelete(userId);
                    userRepository.updateHaveTicket(false, userId);
                }
            }
        }
    }

    @Scheduled(fixedRateString = "5000")
    @Transactional
    public void 연체료부과() {
        ArrayList<Integer> userIdList = new ArrayList<>();

        try {
            String sql = "select * from user";
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                userIdList.add(rs.getInt("id"));
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

        for(int i = 0; i < userIdList.size(); i++) {
            User userEntity = userRepository.findById(userIdList.get(i).intValue());

            if(userEntity.isHaveTicket() == false && userEntity.isState() == true) {
                lateFeeStack += 0.695;

                int lateFee = userEntity.getLateFee();
                System.out.println(lateFeeStack);
                if(lateFeeStack >= 500) {
                    userRepository.updateLateFee(lateFee + 500, userEntity.getId());
                    lateFeeStack = 0;
                }
            }
        }
    }
}
