package com.cos.shumstart.domain.voucher;

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
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name="userId", referencedColumnName = "id")
    private User user;

    private String ticketType;

    //이용권이 가지고 있는 예약번호가 될 것이다.
    private String reservationCode;

    private LocalDateTime voucherStartDate;
    private LocalDateTime voucherEndDate;

    private LocalDateTime createDate;

    private boolean activation;

    @PrePersist
    public void createDate() {
        this.createDate = LocalDateTime.now();
    }

    public boolean getActivation() {
        return this.activation;
    }
}
