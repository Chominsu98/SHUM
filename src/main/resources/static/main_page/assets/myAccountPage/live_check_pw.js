function check_pw(obj){
    var1=document.getElementById("new_password").value;
    var3=document.getElementById("alert_password")

    if(obj.value==var1){
        var3.innerText="일치해요!"
    }
    else{
        var3.innerText="아직틀려요!";
    }
}
