package com.cos.shumstart.service;

import com.cos.shumstart.domain.Report.Report;
import com.cos.shumstart.domain.Report.ReportRepository;
import com.cos.shumstart.domain.rental.RentalRepository;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.umbrella.UmbrellaRepository;
import com.cos.shumstart.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service
public class ReportService {

    private final UserRepository userRepository;
    private final UmbrellaRepository umbrellaRepository;
    private final RentalRepository rentalRepository;
    private final ReportRepository reportRepository;

    @Transactional
    public Report 우산고장신고(int umbrellaId, String message) {

        Umbrella umbrella = new Umbrella();
        umbrella.setId(umbrellaId);

        Report report = new Report();
        report.setUmbrella(umbrella);
        report.setMessage(message);

        umbrellaRepository.updateBoothIdRental(umbrellaId);
        umbrellaRepository.updateRentalState(false, umbrellaId);
        umbrellaRepository.updateBrokenState(true, umbrellaId);

        return reportRepository.save(report);
    }
}
