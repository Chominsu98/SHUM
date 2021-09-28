package com.cos.shumstart.web.boothmodel;

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
    private int leftUmbrella;
    private int brokenUmbrella;
}
