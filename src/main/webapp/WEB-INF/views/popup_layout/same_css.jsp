<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    #popup ,#popup_check_verifynum ,#popup_set_new_password{
        display: flex;
        justify-content: center;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, .7);
        z-index: 100;
    }


    #popup.hide ,#popup_check_verifynum.hide,#popup_set_new_password.hide{
        display: none;
    }

    #popup.has-filter,#popup_check_verifynum.has-filter,#popup_set_new_password.has-filter {
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
    }

    #popup .content,#popup_check_verifynum .content,#popup_set_new_password .content{
        padding: 20px;
        background: rgb(255 255 255 / 20%);
        border-radius: 5px;
        color:white;
        box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
    }
</style>