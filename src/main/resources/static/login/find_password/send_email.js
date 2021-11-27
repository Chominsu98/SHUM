function send_email() {

    //전에 있던 모달창을 닫아준다.
    closePopup("close");
    //순수하게 이메일만을 보내주는 용도
    let userId=document.getElementById("user_id").value;

    let message=document.getElementById("notification");
    let closebutton=document.getElementById("close");

    $.ajax({
            type:"get",
            url:"/auth/find_password/send_email",
            data:{"userId":userId},
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("성공")
                if(data['check']){
                    message.innerText="✔임시 비밀번호로 성공적으로 변경되었습니다.";
                    closebutton.setAttribute("value","success");
                }
                else{
                    message.innerText="❌임시비밀번호로의 변경이 실패되었습니다.";
                    closebutton.setAttribute("value","close");
                }
                showPopup("#popup")//인증번호가 이메일로 잘 갔는지에 대한 모달보여줌
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