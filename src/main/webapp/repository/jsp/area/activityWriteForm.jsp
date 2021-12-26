<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="activityWriteForm">
		<input type="hidden" name="content_seq" id="content_seq" value="5"/>
    	<input type="hidden" name="main_seq" id="main_seq" value="${param.main_seq }"/>
   		액티비티 이름 : <input type="text" name="activity_name" id="activity_name"><br/>
		액티비티 핵심 포인트 : <input type="text" name="activity_point" id="activity_point"><br/>
		액티비티 가격 : <input type="text" name="activity_price" id="activity_price"><br/>
		할인율 : <input type="text" name="activity_saleRate" id="activity_saleRate"><br/>
		옵션 : <label>T<input type="radio" name="activity_option" value="T"></label><label>F<input type="radio" name="activity_option" value="F"></label><br/>
		유효 기간 : <input type="text" name="activity_validDate" id="activity_validDate"><br/>
		포함 사항 : <input type="text" name="activity_inclusion" id="activity_inclusion"><br/>
		취소 및 환불 규정 : <input type="text" name="activity_refund" id="activity_refund"><br/>
		사용방법 : <input type="text" name="activity_used" id="activity_information"><br/>
		상품 정보 : <input type="text" name="activity_information" id="activity_information"><br/>
		주의 사항 : <input type="text" name="activity_warning" id="activity_warning"><br/>
		메인이미지 : <input type="file" name="main_img" id="img"/><br/>
		이미지 : <input type="file" name="img[]" id="img" multiple/><br/>
		<input type="button" id="activityWriteBtn" value="작성완료">
		<input type="reset" value="다시작성">
	</form>
	
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
</body>
</html>