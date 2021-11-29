function sending_lateFee_info() {

    $.ajax({
            type:"post",
            url:"/charge/QRcodePage",
            data:{"finish_paying":true},
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                if(data['check']){
                    console.log("성공!서버로 전송완료")
                }
                else{
                    console.log("실패,,,")
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