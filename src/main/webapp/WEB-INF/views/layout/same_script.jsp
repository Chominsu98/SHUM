<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- Scripts -->
<script src="/main_page/assets/js/jquery.min.js"></script>
<script src="/main_page/assets/js/jquery.scrollex.min.js"></script>
<script src="/main_page/assets/js/jquery.scrolly.min.js"></script>
<script src="/main_page/assets/js/browser.min.js"></script>
<script src="/main_page/assets/js/breakpoints.min.js"></script>
<script src="/main_page/assets/js/util.js"></script>
<script src="/main_page/assets/js/main.js"></script>
<script>
    //드롭다운을 위한 script파일
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }


    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {

            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>