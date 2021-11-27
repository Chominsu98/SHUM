function send_email() {
    //순수하게 이메일만을 보내주는 용도
    let message=document.getElementById("notification_message");
    let closebutton=document.getElementById("close_button");

    $.ajax({
            type:"get",
            url:"/main/myPageAccount/sendmail",
            data:{"send":true},
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("성공")
                if(data['check']){
                    message.innerText="✔인증번호를 회원님의 이메일로 전송하였습니다.";
                    closebutton.setAttribute("value","false");
                }
                else{
                    message.innerText="❌이메일 전송에 실패하였습니다";
                    closebutton.setAttribute("value","false");
                }
                showPopup("#popup",true)//인증번호가 이메일로 잘 갔는지에 대한 모달보여줌
            },
            error:function(request,status,error){
                console.log("실패")
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            complete:function (){
                // showPopup('#popup',true);

            }


        }
    );
}