/**
 * myscript.js
 */
// timestamp형식 대신 가용하는 시간 포맷 메소드
function changeDateString(timestamp){
	var dateF = new Date(timestamp);
	
	var year = dateF.getFullYear();
	var month = make2digits(dateF.getMonth() + 1);
	var date = make2digits(dateF.getDate());
	var hour = make2digits(dateF.getHours());
	var minute = make2digits(dateF.getMinutes());
	var second = make2digits(dateF.getSeconds());
	var dateString = year + "-" + month + "-" + date + "-" + hour + ":" + minute + ":" + second;
	return dateString;
}

// 날짜와 시계메소드인데 , 10 이하면 0n으로 나타내기 위한 메소드
function make2digits(num){
	if(num < 10){
		num = "0" + num;
	}
	return num;
}

// 이미지인지 아닌지 판별하는 메소드 ( .JPG , .PNG , .GIF ) 
function isImage(fileName){
	var dotIndex = fileName.lastIndexOf(".");
	var extName = fileName.substring(dotIndex + 1);
	var upper = extName.toUpperCase();
	
	if(upper == "JPG" || upper == "PNG" || upper == "GIF"){
		return true;
	}else{
		alert("사진업로드 불가");
		return false;
	}
}
