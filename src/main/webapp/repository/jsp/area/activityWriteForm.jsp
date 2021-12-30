<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#activityWriteDiv {
		display: grid;
		grid-template-columns: 200px 280px;
		grid-template-rows: repeat(11, 1fr);
		align-items: center;
	    justify-content: center;
	    justify-items: center;
	    height: 500px;
	}
	
#activityWriteDiv input, #activityWriteDiv textArea {
	width: 100%;
	height: 100%;
	border-bottom: 1px solid;
	border-color: #80808078;
}
</style>

</head>
<body>
	<form id="activityWriteForm">
		<input type="hidden" name="content_seq" id="content_seq" value="5"/>
    	<input type="hidden" name="main_seq" id="main_seq" value="${param.main_seq }"/>
    	<div id="activityWriteDiv">
	    	<div>액티비티 이름 : </div>
	   		<div><input type="text" name="activity_name" id="activity_name"></div>
			<div>액티비티 핵심 포인트 : </div>
			<div><input type="text" name="activity_point" id="activity_point"></div>
			<div>액티비티 가격 : </div>
			<div><input type="text" name="activity_price" id="activity_price"></div>
			<div>할인율 : </div>
			<div><input type="text" name="activity_saleRate" id="activity_saleRate"></div>
			<div>옵션 : </div>
			<div><label>T<input type="radio" name="activity_option" value="T"></label><label>F<input type="radio" name="activity_option" value="F"></label></div>
			<div>유효 기간 : </div>
			<div><input type="text" name="activity_validDate" id="activity_validDate"></div>
			<div>포함 사항 : </div>
			<div><input type="text" name="activity_inclusion" id="activity_inclusion"></div>
			<div>취소 및 환불 규정 : </div>
			<div><input type="text" name="activity_refund" id="activity_refund"></div>
			<div>사용방법 : </div>
			<div><input type="text" name="activity_used" id="activity_information"></div>
			<div>상품 정보 : </div>
			<div><input type="text" name="activity_information" id="activity_information"></div>
			<div>주의 사항 : </div>
			<div><input type="text" name="activity_warning" id="activity_warning"></div>
			<div>메인이미지 : </div>
			<div><input type="file" name="main_img" id="img"/></div>
			<div>이미지 : </div>
			<div><input type="file" name="img[]" id="img" multiple/></div>
		</div>
		<input type="button" id="activityWriteBtn" value="작성완료">
		<input type="reset" value="다시작성">
	</form>
	
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
</body>
</html>