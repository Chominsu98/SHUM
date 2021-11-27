// (1) 회원정보 수정
function update() {
    var is_empty=false;//폼에 빈값이 들어있는지에 대한 검사 필요
    $("#profileUpdate").find('input[name!="phone"]').each(function (){
        if(!$(this).val()){
            is_empty=true;
        }
    });
    if(is_empty){
        return;
    }
    let data=$("#profileUpdate").serialize();
    var message=document.getElementById("notification_message");
    var closebutton=document.getElementById("close_button");

    $.ajax({
        type:"put",
        url:"/main/myPageAccount/update",
        data:data,
        contentType:"application/x-www-form-urlencoded;charset=utf-8",
        dataType:"json",
        success: function (data){
            console.log("성공")
            message.innerText="✔회원정보가 올바르게 수정되었습니다."
            closebutton.setAttribute("value","true");

        },
        error:function(request,status,error){
            console.log("실패")
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            message.innerText="❌회원정보 수정에 오류가 발생했습니다.";
            closebutton.setAttribute("value","false");
        },
        complete:function (){
            showPopup('#popup',true);

        }


    }
);
}