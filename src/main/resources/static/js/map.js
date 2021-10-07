// 각 부스 클릭하면 나오는 자세한 설명
function btnBoothDetail(id, name, left, fixed) {
    var target = document.querySelector('.booth input');
    var boothDetail = document.querySelector('.booth');
    var getMyPosBTN = document.querySelector('.getMyPos img');
    var reloadBTN = document.querySelector('.reload img');

    if (target.value != -1000) {
        var exfocusedBoothDesc = document.querySelector(`.desc_booth${target.value}`);
        var exfocusedBooth = exfocusedBoothDesc.parentNode;
    }

    var focusedBoothDesc = document.querySelector(`.desc_booth${id}`);
    var focusedBooth = focusedBoothDesc.parentNode;

    //같은거 선택
    if (target.value === String(id)) {
        focusedBooth.classList.toggle('focus');
        boothDetail.classList.toggle('invisible');
    } else {    //처음 선택, 다른거 선택
        if (boothDetail.classList.contains('invisible')) {  // 내려가 있는 상태
            //alert('2');
            focusedBooth.classList.add('focus');
            boothDetail.classList.toggle('invisible');
        }
        if (target.value != -1000) {
            exfocusedBooth.classList.remove('focus');
        }
        if (!focusedBooth.classList.contains('focus')) {
            focusedBooth.classList.add('focus');
        }

        var boothDesc = document.querySelector('.boothDesc');
        var desc =
            `<ul id="boothName">` +
            `<li>${name}</li>` +
            `</ul>` +
            `<ul id="boothCount">` +
            `<li>보유 갯수 : ${left + fixed}</li>` +
            `<li>대여 가능 갯수 : ${left}</li>` +
            `<li>점검 상태 : ${fixed}</li>` +
            `</ul>`;
        boothDesc.innerHTML = desc;
        target.value = id;
        map.panTo(positions[id].latlng);
    }

    if (boothDetail.classList.contains('invisible')) {
        // focusedBooth.classList.remove('focus');
        getMyPosBTN.classList.remove('up');
        reloadBTN.classList.remove('up');
    } else {
        // focusedBooth.classList.add('focus');
        getMyPosBTN.classList.add('up');
        reloadBTN.classList.add('up');
    }
}

// 검색 모달창
function modal(id) {
    var modal = document.getElementById("my_modal");
    modal.style.position = "fixed";
    modal.style.display = "flex";

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        var list = document.querySelector('.search_result ul');

        while ( list.hasChildNodes() )
        {
            list.removeChild (list.firstChild);
        }

        var li = document.createElement("li")
        li.appendChild(document.createTextNode("검색 결과가 없습니다."));
        list.appendChild(li);

        var boothName = document.querySelector(".modal_header input")
        boothName.value = '';
        modal.style.display = "none";
    });

    // modal.setStyle({
    //    //position: 'fixed',
    //     display: 'block',
    //     //boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
    //
    //     // 시꺼먼 레이어 보다 한칸 위에 보이기
    //     zIndex: zIndex + 1,
    //
    //     // // div center 정렬
    //     // top: '50%',
    //     // left: '50%',
    //     // transform: 'translate(-50%, -50%)',
    //     // msTransform: 'translate(-50%, -50%)',
    //     // webkitTransform: 'translate(-50%, -50%)',
    //
    //     backgroundColor: "white"
    // });
}

// // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
// Element.prototype.setStyle = function(styles) {
//     for (var k in styles) this.style[k] = styles[k];
//     return this;
// };

// document.getElementById('search').addEventListener('click', function() {
//     // 모달창 띄우기
//     modal('my_modal');
// });

var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),   //지도의 중심 좌표
    level: 3    //지도의 확대 레벨1
};

//지도를 생성
var map = new kakao.maps.Map(container, options);

// 우산 부스 위치를 가져옵니다.
var positions = [];

console.log(numberOfBooth);

for(let i = 0; i < numberOfBooth; i++) {
    positions.push(boothPositions[i]);
}

if (navigator.geolocation) {
    var myPos = null;
    var locPosition = null;

    navigator.geolocation.getCurrentPosition(function(pos) {
        var lat = pos.coords.latitude; // 위도
        lon = pos.coords.longitude; // 경도

        locPosition = new kakao.maps.LatLng(lat, lon);

        var myPosImg = "/images/map/myPos.png";
        var imageSize = new kakao.maps.Size(25, 25);
        var myMarkerImage = new kakao.maps.MarkerImage(myPosImg, imageSize);

        // 내 위치 마커를 생성합니다
        myPos = new kakao.maps.Marker({
            map: map,
            position: locPosition,
            image: myMarkerImage
        });

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition)

        displayMarker();
    });
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    alert('error');
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker() {
    var imageSrc = "/images/map/ping.png";
    var imageSize = new kakao.maps.Size(100, 110);
    //부스 위치 마커를 생성합니다.
    for (var i = 0; i < positions.length; i++) {

        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        var marker = new kakao.maps.Marker({
            map: map,
            position: positions[i].latlng,
            title: positions[i].title,
            image: markerImage
        });

        var booth_id = "desc_booth" + i
        var content = `<div class="booth_info">` +
            `<div class="${booth_id}" onclick="btnBoothDetail(${i},'${positions[i].title}', ${positions[i].left}, ${positions[i].fixed})">남은 갯수: ${positions[i].left}개</div>` +
            `</div>`;

        var infowindow = new kakao.maps.InfoWindow({
            map : map,
            position : positions[i].latlng,
            content: content
        })

        infowindow.open(map, marker);
        map.setCenter(locPosition)
        // var customOverlay = new kakao.maps.CustomOverlay({
        //     map: map,
        //     position: positions[i].latlng,
        //     content: content
        // });
    }

    setInterval(function(){
        getUserPos();
    }, 1000);

    //getUserPos(myPos);

}

function getUserPos() {
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(pos) {
            var lat = pos.coords.latitude, // 위도
                lon = pos.coords.longitude; // 경도
            locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다.(내 위치)

            var myPosImg = "/images/map/myPos.png";
            var imageSize = new kakao.maps.Size(50, 50);
            var myMarkerImage = new kakao.maps.MarkerImage(myPosImg, imageSize);

            myPos.setMap(null);
            //내 위치 마커를 생성합니다
            myPos = new kakao.maps.Marker({
                map: map,
                position: locPosition,
                image: myMarkerImage
            });
        });
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        alert('error');
    }
}

function search() {
    var boothName = document.querySelector(".modal_header input");
    var isNotChanged = new Boolean(true);

    var list = document.querySelector('.search_result ul');

    while ( list.hasChildNodes() )
    {
        list.removeChild (list.firstChild);
    }

    var i = 0;
    positions.forEach(position => {
        for ( key in position) {
            if (key === "title" && position[key].includes(boothName.value)) {
                isNotChanged = false;
                var searchResultList = document.querySelector('.search_result ul');
                var li = document.createElement("li");
                li.appendChild(document.createTextNode(`${positions[i].title} ( ${positions[i].left}개 )`));
                li.onclick = function () {
                    var modal = document.getElementById("my_modal");
                    modal.style.display = "none";
                    btnBoothDetail(position.id, position.title, position.left, position.fixed);
                }
                searchResultList.appendChild(li);
            }
        }
        i += 1;
    })
    if (isNotChanged) {
        var li = document.createElement("li")
        li.appendChild(document.createTextNode("검색 결과가 없습니다."));
        list.appendChild(li);
    }
}

// var boothNameSearchBTN = document.querySelector(".modal_header button");
// boothNameSearchBTN.addEventListener('click', function () {
//     search();
// });

var getMyPosBTN = document.querySelector('.getMyPos');
getMyPosBTN.addEventListener('click', function() {
    map.panTo(locPosition);
});

var reloadBTN = document.querySelector('.reload');
reloadBTN.addEventListener('click', function() {
    location.reload();
});

var navigatorBTN = document.querySelector('#navigatorIcon');
navigatorBTN.addEventListener('click', function() {
    var target = document.querySelector('.booth input');
    var booth_id = target.value;
    location.href=`https://map.kakao.com/link/to/${positions[booth_id].title}, ${positions[booth_id].latlng.getLat()}, ${positions[booth_id].latlng.getLng()}`;
});
