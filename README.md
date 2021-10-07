SHUM 공유 우산 서비스
해야할 것 : 뭐가 있을까...

(2021-10-08 UPDATE)

-user에 haveTicket추가

-booth의 leftUmbrella를 leftFreeUmbrella, leftLocationUmbrella로 나눔(프리에디션, 지역에디션 각각 개수로)

-서비스와 jsp에 썼던 leftUmbrella를 leftFreeUmbrella, leftLocationUmbrella로 고침
    
    BoothService 58, 59번 줄
    RentalService 46-53번 줄, 73-80번 줄
    
    showUmbrella.jsp 186번 줄
    nearBoothPage.jsp 98번 줄
    rentalshowBooth.jsp 19번 줄

(2021-10-08 새벽 추가 UPDATE)

-user에 money열 삭제, lateFee열 추가(연체료)

-이용권 구매 후 첫 대여 시간 기준으로 24시간 이후에 이용권 소멸되도록 변경(원래는 구매 시간 기준이였음)

-myPage, QRcodePage에 이용권 정보 나타내는 부분에서 사용 시간에 첫 대여 이전이면 "사용 전"을, 첫 대여 이후이면 남은 이용권 시간을 띄우도록 수정

-지도 버그 수정 완료

-연체료 기능 추가(일단 1시간에 500원으로 맞춰놓음)