package com.cos.shumstart.domain.voucher;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface VoucherRepository extends JpaRepository<Voucher, Integer> {
    Voucher findByUserId(int userId);
    Voucher findById(int Id);

    @Modifying
    @Query("DELETE FROM Voucher WHERE user.id = :userId")
    int voucherDelete(int userId);
}
