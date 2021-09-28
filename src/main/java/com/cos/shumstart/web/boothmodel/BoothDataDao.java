package com.cos.shumstart.web.boothmodel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.cos.shumstart.domain.booth.Booth;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class BoothDataDao {

    private final BoothRepository boothRepository;

    public Booth 부스번호(int id) {
        Booth boothEntity = boothRepository.findById(id);

        return boothEntity;
    }

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    @Autowired
    private DataSource dataSource;

    public ArrayList<BoothDto> getDataAll(){
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
                dto.setLeftUmbrella(rs.getInt("leftUmbrella"));
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