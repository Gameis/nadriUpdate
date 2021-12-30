<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#hotelWriteDiv {
		display: grid;
		grid-template-columns: 200px 280px;
		grid-template-rows: repeat(11, 1fr);
		align-items: center;
	    justify-content: center;
	    justify-items: center;
	    height: 500px;
	}
	
	#hotelWriteDiv input, #hotelWriteDiv textArea {
		width: 100%;
		height: 100%;
		border-bottom: 1px solid;
		border-color: #80808078;
	}
</style>
</head>
<body>
	<form id="hotelWriteForm">
		<input type="hidden" id="content_seq" name="content_seq" value="4"/>
		<input type="hidden" id="main_seq" name="main_seq" value="${param.main_seq }"/>
		<div id="hotelWriteDiv">
			<div>호텔 이름 : </div>
			<div><input type="text" name="hotel_name" value=""/></div>
			<div>청결도 : </div>
			<div><input type="text" name="hotel_clean" value=""/></div>
			<div>시설 : </div>
			<div><input type="text" name="hotel_facility" value=""/></div>
			<div>위치 : </div>
			<div><input type="text" name="hotel_location" value=""/></div>
			<div>서비스 : </div>
			<div><input type="text" name="hotel_service" value=""/></div>
			<div>메인이미지 : </div>
			<div><input type="file" name="main_img" id="img"/></div>
			<div>호텔 주소 : </div>
			<div><input type="text" name="hotel_address" value=""/></div>
			<div>건축년도 : </div>
			<div><input type="text" name="hotel_year" value=""/></div>
			<div>리모델링 : </div>
			<div><input type="text" name="hotel_remodeling" value=""/></div>
			<div>객실 수 : </div>
			<div><input type="text" name="hotel_room" value=""/></div>
			<div>호텔 정보 : </div>
			<div><input type="text" name="hotel_info" value=""/></div>
		</div>
		<input type="button" id="hotelWriteBtn" value="작성완료"/>
	</form>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
</body>
</html>