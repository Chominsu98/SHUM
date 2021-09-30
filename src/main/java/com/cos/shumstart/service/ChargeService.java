package com.cos.shumstart.service;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.booth.BoothRepository;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.rental.RentalRepository;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.umbrella.UmbrellaRepository;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service
public class ChargeService {

    private final RentalRepository rentalRepository;
    private final BoothRepository boothRepository;
    private final UserRepository userRepository;
    private final UmbrellaRepository umbrellaRepository;

    @Transactional
    public void 충전하기(int chargeMoney, int userId) {

        User userEntity = userRepository.findById(userId);

        int money = userEntity.getMoney();
        userRepository.updateMoney(money + chargeMoney, userId);
    }
}
