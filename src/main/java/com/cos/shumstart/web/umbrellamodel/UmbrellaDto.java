package com.cos.shumstart.web.umbrellamodel;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UmbrellaDto {

    private int umbrellaNumber;

    private boolean rentalState;
    private boolean brokenState;

    private Booth boothName;
    private User username;
}
