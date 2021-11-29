package com.cos.shumstart.service;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.booth.BoothRepository;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.umbrella.UmbrellaRepository;
import com.cos.shumstart.web.dto.BoothDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@RequiredArgsConstructor
@Repository
public class BoothService {

    private final BoothRepository boothRepository;
    private final UmbrellaRepository umbrellaRepository;

    public Booth 부스정보(int id) {
        Booth boothEntity = boothRepository.findById(id);

        return boothEntity;
    }

    public Umbrella 우산정보(int id) {
        Umbrella umbrellaEntity = umbrellaRepository.findById(id);

        return umbrellaEntity;
    }

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    @Autowired
    private DataSource dataSource;

    public ArrayList<BoothDto> 부스목록(){
        ArrayList<BoothDto> list = new ArrayList<BoothDto>();
        try {
            String sql = "select * from booth";
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                BoothDto dto = new BoothDto();
                dto.setId(rs.getInt("id"));
                dto.setBoothName(rs.getString("boothName"));
                dto.setLatitude(rs.getDouble("latitude"));
                dto.setLongitude(rs.getDouble("longitude"));
                dto.setLeftFreeUmbrella(rs.getInt("leftFreeUmbrella"));
                dto.setLeftLocationUmbrella(rs.getInt("leftLocationUmbrella"));
                dto.setBrokenUmbrella(rs.getInt("brokenUmbrella"));
                dto.setTotalUmbrella(rs.getInt("totalUmbrella"));
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
        return list;
    }

}