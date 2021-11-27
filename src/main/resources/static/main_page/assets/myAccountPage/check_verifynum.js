function check_verifynum() {

    var is_empty=false;//폼에 빈값이 들어있는지에 대한 검사 필요
    var verify_num=document.getElementById("verify_number").value;
    if(!verify_num){
        return;
    }
    //들어오자마자 먼저 팝업은 닫아주자 다음모달을 위해
    closePopup('#popup_check_verifynum',"false");

    let user_input_num=$("#verify_number").val();
    let message=document.getElementById("notification_message");
    let closebutton=document.getElementById("close_button");

    $.ajax({
            type:"post",
            url:"/main/myPageAccount/checknum",
            data:{"user_input_num":user_input_num},
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("성공")
                if(data['check']){
                    message.innerText="✔인증이 올바르게 완료되었습니다"
                    closebutton.setAttribute("value","new_password")

                }
                else{
                    message.innerText="❌인증에 실패했습니다.번호를 다시인증 해주시기 바랍니다.";
                    closebutton.setAttribute("value","false");
                }
                showPopup("#popup",true);//여기까지하면 인증완료메시지가 출력
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