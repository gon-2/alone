/*
 * 2021-01-10
 * Author : 이정훈
 * code Explanation : header에 붙을 디지털 시계
 */

function setClock(){
	var dateF = new Date();
	
	var year = dateF.getFullYear();
	var month = make2digits(dateF.getMonth() + 1);
	var date = make2digits(dateF.getDate());
	var hour = make2digits(dateF.getHours());
	var minute = make2digits(dateF.getMinutes());
	var second = make2digits(dateF.getSeconds());
	var dateString = year + "-" + month + "-" + date + "-" + hour + ":" + minute + ":" + second;
	
	document.getElementById("date").innerHTML = year + "년" + month + "월" + date + "일";
	document.getElementById("time").innerHTML = hour + ":" + minute + ":" + second;
	
}

// 날짜와 시계메소드인데 , 10 이하면 0n으로 나타내기 위한 메소드
function make2digits(num){
	if(num < 10){
		num = "0" + num;
	}
	return num;
}

window.onload = function(){
	setClock();
	setInterval(setClock , 1000);
}