function getDistance(lat1,lng1,lat2,lng2) {
    function deg2rad(deg) {
        return deg * (Math.PI/180)
    }
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2-lat1);//deg2rad below
    var dLon = deg2rad(lng2-lng1);
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c; // Distance in km
    return d;
}

// 우산 부스 위치를 가져옵니다.
var positions = [];

for(let i = 0; i < numberOfBooth; i++) {
    positions.push(boothPositions[i]);
}
console.log(positions);

if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(pos) {
        var lat = pos.coords.latitude, // 위도
            lon = pos.coords.longitude; // 경도

        for (var i = 0; i < positions.length; i++) {
            var distance = getDistance(lat, lon, positions[i].latlng.getLat(), positions[i].latlng.getLng())
            positions[i].distance = distance;
        }

        positions.sort(function (a, b) {
            if (a.distance > b.distance) {
                return 1;
            }
            if (a.distance < b.distance) {
                return -1;
            }
            return 0;
        })

        var nearBoothList = document.querySelector('.nearBoothList');
        for (var i = 0; i < positions.length; i++) {
            var li = document.createElement("li");
            li.appendChild(document.createTextNode(`${positions[i].title} ( ${positions[i].left}개 )`));
            nearBoothList.appendChild(li);
        }
    });

} else {
    alert('error');
}

