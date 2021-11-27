package com.cos.shumstart.domain.booth;

import com.cos.shumstart.domain.umbrella.Umbrella;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Booth {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true)
    private String boothName;

    private double latitude;
    private double longitude;

    private int totalUmbrella;

    private int leftFreeUmbrella;
    private int leftLocationUmbrella;

    private int brokenUmbrella;

    @OneToMany(mappedBy = "booth")
    private List<Umbrella> umbrellas = new ArrayList<>();
}
