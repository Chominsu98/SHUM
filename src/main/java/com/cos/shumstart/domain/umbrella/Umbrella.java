package com.cos.shumstart.domain.umbrella;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.user.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Umbrella {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int umbrellaNumber;

    private boolean rentalState;

    private boolean brokenState;

    @ManyToOne
    @JoinColumn(name="boothId", referencedColumnName = "id")
    private Booth booth;
}
