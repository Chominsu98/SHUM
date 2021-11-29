function change_pw() {

    var is_empty=false;//폼에 빈값이 들어있는지에 대한 검사 필요
    $("#new_password_change").find('input[type!="submit"]').each(function (){
        if(!$(this).val()){
            is_empty=true;
        }
    });
    if(is_empty){
        return;
    }

    let data=$("#new_password_change").serialize();
    let message=document.getElementById("notification_message");
    let closebutton=document.getElementById("close_button");

    $.ajax({
            type:"post",
            url:"/main/myPageAccount/changePassword",
            data:data,
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("인증성공")
                if(data['check']){
                    message.innerText="✔패스워드가 올바르게 변경되었습니다"
                    closebutton.setAttribute("value","false")

                    showPopup("#popup",true);//여기까지하면 인증완료메시지가 출력
                    closePopup("#popup_set_new_password","false");//인증메시지 보여주면서 비밀번호변경페이지는 지워준다.
                }
                else{
                    message.innerText="❌현재비밀번호가 틀립니다";
                    closebutton.setAttribute("value","false");
                    showPopup("#popup",true);//여기까지하면 인증완료메시지가 출력
                }

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