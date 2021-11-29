package com.cos.shumstart.domain.rental;

import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.user.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Rental {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name="userId", referencedColumnName = "id")
    private User user;

    @OneToOne
    @JoinColumn(name="umbrellaId", referencedColumnName = "id")
    private Umbrella umbrella;

    private boolean activation;

    private LocalDateTime createDate;

    private LocalDateTime returnDate;

    @PrePersist
    public void createDate() {
        this.createDate = LocalDateTime.now();
    }

    public boolean getActivation() {
        return this.activation;
    }
}
