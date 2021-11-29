function paying_system (state,user) {

    var message=document.getElementById("notification");
    var ticket_type;
    // getter
    var IMP = window.IMP;
    IMP.init("imp04138971");
    var money;
    var name;
    var number=user.phone;
    if(number==null){
        number="010-1234-5678";
    }

    if(state=="ticket_payform"){
        ticket_type=document.getElementById("ticketType").value;
        name='우산'+ticket_type;
        money=document.getElementById("total-price").innerText.replace("원","");
    }
    else{
        name='연체료부과';
        money=user.lateFee;
    }

    console.log(ticket_type);

    IMP.request_pay({
        pg: 'kakao',
        merchant_uid: 'merchant_' + new Date().getTime(),

        name: name,
        amount: money,
        buyer_email: user.email,
        buyer_name: user.name,
        buyer_tel: number,
        buyer_addr: '서울시 노원구',
        buyer_postcode: '123-456'
    }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
            var msg = '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;

            if(state=='ticket_payform'){
                message.innerText="✔"+ticket_type+"으로 결제가 완료되었습니다.";
                document.getElementById("close").setAttribute("value","send_paying_info");//여기에서 ajax로 보내주어야할 버튼으로 변경

            }
            else{
                message.innerText="✔"+"연체료부과가 성공적으로 결제되었습니다.QR코드를 찍고 반납을 진행해주시기 바랍니다.";
                document.getElementById("close").setAttribute("value","sending_lateFee_info");
                document.getElementById("using_more").style.display='none';//좀 더 사용 버튼은 안보이게
            }

        } else {
            var msg = '에러내용 : ' + rsp.error_msg;
            if(state=="ticket_payform"){
                message.innerText="❌"+ticket_type+"으로 결제를 실패했습니다."+msg;
                document.getElementById("close").setAttribute("value","close");//일반 닫기버튼
            }
            else{
                message.innerText="❌"+"연체료부과 결제에 실패했습니다.";
                document.getElementById("close").setAttribute("value","using_more");
                document.getElementById("using_more").style.display='none';//좀 더 사용 버튼은 안보이게
            }

        }
        showPopup(true);
    });
}

function send_paying_info(){//post로 hidden form태그 생성해서 전송
    var ticket_type=document.getElementById("ticketType").value;

    var form=document.createElement("form");
    form.setAttribute("method",'post');
    form.setAttribute("action","/charge/payform");
    var hiddenfield=document.createElement("input");
    hiddenfield.setAttribute("type","hidden");
    hiddenfield.setAttribute("name","ticketType");
    hiddenfield.setAttribute("value",ticket_type);
    form.appendChild(hiddenfield);

    document.body.appendChild(form);
    form.submit();

}