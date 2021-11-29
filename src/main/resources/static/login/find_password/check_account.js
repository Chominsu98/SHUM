function check_account() {

    var is_empty=false;//폼에 빈값이 들어있는지에 대한 검사 필요
    $("#name_id_input_form").find('input[type!="submit"]').each(function (){
        if(!$(this).val()){
            is_empty=true;
        }
    });
    if(is_empty){
        return;
    }

    let data=$("#name_id_input_form").serialize();
    let message=document.getElementById("notification");

    $.ajax({
            type:"post",
            url:"/auth/find_password",
            data:data,
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("성공")
                if(data['check']){
                    message.innerText="✔인증이 올바르게 완료되었습니다.회원님의 이메일로 임시비밃번호가 발급되어 전송되었습니다."
                    //이메일 전송기능 ajax로 호출
                    send_email();
                }
                else{
                    message.innerText="❌인증에 실패했습니다.다시한번 확인해주시기 바랍니다";
                }

            },
            error:function(request,status,error){
                console.log("실패")
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                message.innerText="❌인증과정에 오류가 발생했습니다.";
            },
            complete:function (){
                showPopup('#popup');//여기까지하면 인증완료메시지가 출력

            }


        }
    );
}