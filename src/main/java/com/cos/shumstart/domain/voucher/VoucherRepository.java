package com.cos.shumstart.domain.voucher;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;

public interface VoucherRepository extends JpaRepository<Voucher, Integer> {
    Voucher findByUserId(int userId);
    Voucher findById(int Id);

    @Modifying
    @Query("UPDATE Voucher v SET v.voucherStartDate = :voucherStartDate WHERE v.id = :id")
    int updateVoucherStartDate(LocalDateTime voucherStartDate, int id);

    @Modifying
    @Query("DELETE FROM Voucher WHERE user.id = :userId")
    int voucherDelete(int userId);
}
