package com.cos.shumstart.web.dto;

import com.cos.shumstart.domain.booth.Booth;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoothDto {
    private int id;

    private String boothName;

    private double latitude;
    private double longitude;

    private int totalUmbrella;

    private int leftFreeUmbrella;
    private int leftLocationUmbrella;

    private int brokenUmbrella;
}
