package com.cos.shumstart.domain.voucher;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface VoucherRepository extends JpaRepository<Voucher, Integer> {
    List<Voucher> findByUserId(int userId);
    List<Voucher> findById(int Id);
    Voucher findByReservationCode(String ReservationCode);

    @Modifying
    @Query("UPDATE Voucher v SET v.voucherStartDate = :voucherStartDate WHERE v.id = :id")
    int updateVoucherStartDate(LocalDateTime voucherStartDate, int id);

    @Modifying
    @Query("UPDATE Voucher v SET v.voucherEndDate = :voucherEndDate WHERE v.id = :id")
    int updateVoucherEndDate(LocalDateTime voucherEndDate, int id);

    @Modifying
    @Query("UPDATE Voucher v SET v.activation = :activation WHERE v.id = :id")
    int updateActivation(boolean activation, int id);

    @Modifying
    @Query("DELETE FROM Voucher WHERE user.id = :userId")
    int voucherDelete(int userId);
}
