<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="hotelWriteForm">
		<input type="text" id="content_seq" name="content_seq" value="4"/>
		<input type="text" id="main_seq" name="main_seq" value="${param.main_seq }"/><br/>
		호텔 이름 : <input type="text" name="hotel_name" value=""/><br/>
		청결도 : <input type="text" name="hotel_clean" value=""/><br/>
		시설 : <input type="text" name="hotel_facility" value=""/><br/>
		위치 : <input type="text" name="hotel_location" value=""/><br/>
		서비스 : <input type="text" name="hotel_service" value=""/><br/>
		메인이미지 : <input type="file" name="main_img" id="img"/><br/>
		<!-- 호텔 주소 :  --><input type="hidden" name="hotel_address" value=""/><br/>
		<!-- 건축년도 :  --><input type="hidden" name="hotel_year" value=""/><br/>
		<!-- 리모델링 :  --><input type="hidden" name="hotel_remodeling" value=""/><br/>
		<!-- 객실 수 :  --><input type="hidden" name="hotel_room" value=""/><br/>
		<!-- 호텔 정보 :  --><input type="hidden" name="hotel_info" value=""/><br/>
		<input type="button" id="hotelWriteBtn" value="작성완료"/><input type="reset" value="다시작성"/>
	</form>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
</body>
</html>