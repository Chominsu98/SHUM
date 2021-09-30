
var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),   //지도의 중심 좌표
    level: 3    //지도의 확대 레벨
};

function btnBoothDetail()
{
    alert('hi');
    var boothDetail = document.querySelector('.booth');
    boothDetail.classList.toggle('invisible');
    var boothDesc = document.querySelector('.boothDesc');
    alert(boothDetail.innerHTML);
}

//지도를 생성
var map = new kakao.maps.Map(container, options);

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
if (navigator.geolocation) {
// GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다.(내 위치)

        // 우산 부스 위치를 가져옵니다.
        var positions = [
            {
                title: '부스1',
                latlng: new kakao.maps.LatLng(37.5016992, 126.9628928),
                left: 2
            },
            {
                title: '부스2',
                latlng: new kakao.maps.LatLng(37.5006992, 126.961888),
                left: 3
            },
            {
                title: '부스3',
                latlng: new kakao.maps.LatLng(37.4997811, 126.961111),
                left: 4
            },
            {
                title: '부스4',
                latlng :new kakao.maps.LatLng(37.4988888, 126.962777),
                left: 5
            }
        ]
            //message = '<div style="padding:5px;">남은 갯수는: 2개</div>'; // 인포윈도우에 표시될 내용입니다

        // 내 위치와 우스 부스 위치를 마커로 전송합니다.
        displayMarker(locPosition, positions);
    });
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
    message = 'geolocation을 사용할수 없어요..'

    //displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, position) {

    var imageSrc = "https://mblogthumb-phinf.pstatic.net/20160819_217/oceansiren_1471601176631Ysus8_PNG/vector_umbrella-11.png?type=w800";

    // 부스 위치 마커를 생성합니다.
    for (var i=0;i<position.length;i++) {
        var imageSize = new kakao.maps.Size(40, 45);

        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        var marker = new kakao.maps.Marker({
            map: map,
            position: position[i].latlng,
            title: position[i].title,
            image: markerImage
        });

        // kakao.maps.event.addEventListener(marker, 'click', function() {
        //     alert('hi');
        // })
        //
        var booth_id = "desc_booth"+i
        var content = '<div class="customoverlay" style="padding:5px;"> ' +
            '<div class='+booth_id+' onclick="btnBoothDetail()">남은 갯수는: ' + position[i].left +'개</div>' +
            '</div>';

        var customOverlay = new kakao.maps.CustomOverlay({
            map: map,
            position: position[i].latlng,
            content : content
        });
    }

    var myPosImg = "https://img.pikbest.com/58pic/27/61/87/47U58PICkiscVepeaMwW0_PIC2018.png!c1024wm0/compress/true/progressive/true/format/webp/fw/1024";
    var imageSize = new kakao.maps.Size(60, 70);
    var myMarkerImage = new kakao.maps.MarkerImage(myPosImg, imageSize);
    // 내 위치 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: locPosition,
        image: myMarkerImage
    });

    // kakao.maps.event.addEventListener(marker, 'click', function() {
    //     alert('hi');
    // });
    // var iwContent = message;// 인포윈도우에 표시할 내용
    // //
    // 인포윈도우를 생성합니다
    // var infowindow = new kakao.maps.InfoWindow({
    //     content : iwContent
    // });
    //
    // // 인포윈도우를 마커위에 표시합니다
    // infowindow.open(map, marker);

    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);
};

var reload_button = document.querySelector('.reload');

reload_button.addEventListener('click', function() {
    location.reload();
});
