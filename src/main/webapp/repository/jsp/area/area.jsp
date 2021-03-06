<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>서울 여행 코스 & 인기 여행지 추천 | 트립닷컴</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="/nadri/repository/css/area/area.css">
<link rel="stylesheet" href="/nadri/repository/css/area/writeForm.css">
<link href="/nadri/repository/img/main/trip.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<input type="hidden" id="main_seq" value="${param.main_seq}" />
	<input type="hidden" id="main_name" value=""/>
	<input type="hidden" id="memId" value="${memId }" />
	<div id="areaWrap">
		<div id="areaHeader">
			<div id="areaPath">
				<div class="areaPathItem">
					<a href="/nadri">&nbsp;&nbsp;홈&nbsp;&nbsp;</a>
				</div>
				<div class="areaPathItem">
					<a href="#">&nbsp;&nbsp;아시아&nbsp;&nbsp;</a>
				</div>
				<div class="areaPathItem">
					<a href="#">&nbsp;&nbsp;대한민국&nbsp;&nbsp;</a>
				</div>
				<div class="areaPathItem" style="color: black;">지역 이름</div>
			</div>
			<!--areaPath-->
			<div id="areaSearch">
				<div id="areaSearch_input">
					<input type="text" class="search" placeholder="여행지, 명소, 호텔 등으로 검색"
						value="" onkeyup="searchEnterkey()">
				</div>
				<div id="areaSearch_button">
					<div id="areaSearch_icon"></div>
				</div>
			</div>
			<!--areaSearch-->
		</div>
		<!--areaHeader-->
		<div id="areaDestination">
			<div id="areaDestination_name"></div>
			<div id="areaSuperDestination">
				<div class="areaSuperDestination_icon">
					<i class="bi bi-geo-alt-fill"></i>
				</div>
				<div id="areaSuperDestination_name">대한민국</div>
				<div class="areaSuperDestination_icon">
					<i class="bi bi-chevron-right"></i>
				</div>
			</div>
		</div>
		<!--areaDestination-->
		<div id="areaNav">
			<a href="#pop">
				<div class="module">
					<i class="bi bi-bank"></i>
					<div>
						<span>명소</span>
					</div>
				</div>
			</a> <a href="#hotel">
				<div class="module">
					<i class="bi bi-building"></i>
					<div>
						<span>호텔</span>
					</div>
				</div>
			</a> <a href="#activity">
				<div class="module">
					<i class="bi bi-tsunami"></i>
					<div>
						<span>액티비티</span>
					</div>
				</div>
			</a> <a href="#tripmoment">
				<div class="module">
					<i class="bi bi-camera"></i>
					<div>
						<span>트립모먼트</span>
					</div>
				</div>
			</a>
		</div>
		<!--areaNav-->
		<div id="areaMainImg">
			<img id="areaMainBig" alt="1.jpg" src="" />
			<div id="areaMainSmall">
				<img alt="2.jpg" src="" /> <img alt="3.jpg" src="" />
			</div>
		</div>
		<!--areaMainImg-->
		<div id="pop" style="display: hidden;"></div>
		<br>
		<div class="areaSlideTitle">
			<h2 style="font-weight: bold;">
				<span>지역 이름 인기명소</span>
				<button class="btn btn-primary addButton" id="addPopBtn" data-bs-toggle="modal" data-bs-target="#popWriteModal">+</button>
			</h2>
			<!--divSlide-->
			<div class="areaSlide" style="background: rgba(40, 125, 250, .1);">
				<div id="areaPopularLocation_slide" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner" id="pop-carousel-inner"></div>
					<!--carousel-inner-->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#areaPopularLocation_slide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#areaPopularLocation_slide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!--areaPopularLocation_slide-->
			</div>
			<!--areaSlide-->
		</div>
		<!--areaSlideTitle-->
		<div class="modal fade" id="popWriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">인기 명소</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				<form id="popWriteForm" class="popWriteForm">
				   	<input type="hidden" name="content_seq" id="content_seq" value="3"/>
				   	<input type="hidden" name="main_seq" id="main_seq" value="${param.main_seq }"/>
				   	<div id="popWriteDiv">
				   		<div>명소이름</div>
				   		<div class="inputDiv"><input type="text" name="pop_name" id="pop_name"/></div>
				   		<div>영업시간</div>
				        <div><input type="text" name="pop_businessTime" id="pop_businessTime"/></div>
				        <div>관광시간</div>
				        <div><input type="text" name="pop_tourismTime" id="pop_tourismTime"/></div>
				        <div>전화번호</div>
				        <div><input type="text" name="pop_call" id="pop_call"/></div>
				        <div>주소</div>
				        <div><input type="text" name="address_name" id="address_name" class="address_name" readonly/></div>
				        <div>x</div>
				        <div><input type="text" name="map_x" id="map_x" class="map_x" readonly/></div>
				        <div>y</div>
				        <div><input type="text" name="map_y" id="map_y" class="map_y" readonly/></div>
				        <div>메인이미지</div>
				        <div>
				        	<label for="btnAtt">
					        	<div id="att_zone" style="display: inline-block; position:relative; z-index: 1; width: 100px; height: 100px;">
					        		<img style="width: 100%; height: 100%; z-index:none; color:red;" src="/nadri/repository/img/area/plus.svg"/>
					        	</div>
				        	</label>
				        	<div style="display: none;"><input type="file" name="main_img" id="btnAtt"/></div>
				        </div>	
				        <div>이미지 : </div>
				        <div><div id="image_container"></div><input type="file" name="img[]" id="img" multiple/></div>
				        <div style="position: relative; top:-37px;">추가정보소개 : </div>
				        <div><textarea rows="5" cols="35" name="detailInfo" id="detailInfo" style="border: 1px solid; border-color: #80808078;"></textarea></div>
					</div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="popWriteBtn">작성완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!--여기까지 인기명소-->
		<!--여기부터 인기호텔-->
		<div id="hotel" style="display: hidden;"></div>
		<br>
		<div class="areaSlideTitle">
			<h2 style="font-weight: bold;">
				<span>인기 호텔</span>
				<button class="btn btn-primary addButton" id="addHotelBtn" data-bs-toggle="modal" data-bs-target="#hotelWriteModal">+</button>
			</h2>
			<!--divSlide-->
			<div class="areaSlide">
				<div id="areaHotel_slide" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner" id="hotel-carousel-inner"></div>
					<!--carousel-inner-->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#areaHotel_slide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#areaHotel_slide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		<div class="modal fade" id="hotelWriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">인기 호텔</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				<form id="hotelWriteForm">
					<input type="hidden" id="content_seq" name="content_seq" value="4"/>
					<input type="hidden" id="main_seq" name="main_seq" value="${param.main_seq }"/>
					<div id="hotelWriteDiv">
						<div>호텔 이름</div>
						<div><input type="text" name="hotel_name" value=""/></div>
						<div>청결도</div>
						<div><input type="text" name="hotel_clean" value=""/></div>
						<div>시설</div>
						<div><input type="text" name="hotel_facility" value=""/></div>
						<div>위치</div>
						<div><input type="text" name="hotel_location" value=""/></div>
						<div>서비스</div>
						<div><input type="text" name="hotel_service" value=""/></div>
						<div>호텔 주소</div>
						<div><input type="text" name="hotel_address" value=""/></div>
						<div>건축년도</div>
						<div><input type="text" name="hotel_year" value=""/></div>
						<div>리모델링</div>
						<div><input type="text" name="hotel_remodeling" value=""/></div>
						<div>객실 수</div>
						<div><input type="text" name="hotel_room" value=""/></div>
						<div>메인이미지</div>
						<div><input type="file" name="main_img" id="img"/></div>
						<div style="position: relative; top:-37px;">호텔 정보</div>
						<div><textarea rows="5" cols="35" name="hotel_info" style="border: 1px solid; border-color: #80808078;"></textarea></div>
					</div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="hotelWriteBtn">작성완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!--여기까지 인기호텔-->
		<!--여기부터 액티비티-->
		<div id="activity" style="display: hidden;"></div>
		<br>
		<div class="areaSlideTitle">
			<h2 style="font-weight: bold;">
				<span>액티비티</span>
				<button class="btn btn-primary addButton" id="addActivityBtn" data-bs-toggle="modal" data-bs-target="#activityWriteModal">+</button>
			</h2>
			<!--divSlide-->
			<div class="areaSlide">
				<div id="areaActivity_slide" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner" id="activity-carousel-inner"></div>
					<!--carousel-inner-->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#areaActivity_slide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#areaActivity_slide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!--areaHotel_slide-->
			</div>
		</div>
		<div class="modal fade" id="activityWriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">액티비티</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				<form id="activityWriteForm">
					<input type="hidden" name="content_seq" id="content_seq" value="5"/>
			    	<input type="hidden" name="main_seq" id="main_seq" value="${param.main_seq }"/>
			    	<div id="activityWriteDiv">
				    	<div>액티비티 이름</div>
				   		<div><input type="text" name="activity_name" id="activity_name"></div>
						<div>액티비티 핵심 포인트</div>
						<div><input type="text" name="activity_point" id="activity_point"></div>
						<div>액티비티 가격</div>
						<div><input type="text" name="activity_price" id="activity_price"></div>
						<div>할인율</div>
						<div><input type="text" name="activity_saleRate" id="activity_saleRate"></div>
						<div>옵션</div>
						<div id="activity_option"><label>T<input type="radio" name="activity_option" value="T"></label><label>F<input type="radio" name="activity_option" value="F"></label></div>
						<div>유효 기간</div>
						<div><input type="text" name="activity_validDate" id="activity_validDate"></div>
						<div>포함 사항</div>
						<div><input type="text" name="activity_inclusion" id="activity_inclusion"></div>
						<div>취소 및 환불 규정</div>
						<div><input type="text" name="activity_refund" id="activity_refund"></div>
						<div>사용방법</div>
						<div><input type="text" name="activity_used" id="activity_information"></div>
						<div>상품 정보</div>
						<div><input type="text" name="activity_information" id="activity_information"></div>
						<div>주의 사항</div>
						<div><input type="text" name="activity_warning" id="activity_warning"></div>
						<div>메인이미지</div>
						<div><input type="file" name="main_img" id="img"/></div>
						<div>이미지</div>
						<div><input type="file" name="img[]" id="img" multiple/></div>
					</div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="activityWriteBtn">작성완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!--여기까지 액티비티-->
		<div class="areaInfo">
			<h2>지역이름 여행 정보</h2>
			<div class="areaInfo-title">
				<div class="areaInfo-title-icon">
					<i class="bi bi-map"></i>
				</div>
				<div class="area-title-text">지역이름 소개</div>
				<div class="area-info-body">
					<div class="area-content">
						<div class="area-content-text">
							<p></p>
						</div>
						<div class="area-content-plus">
							<span data-bs-toggle="modal" data-bs-target="#staticBackdrop">더
								보기</span> <i class="bi bi-chevron-right"></i>
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop"
								data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">서울 소개</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body" id="seoulInfo"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="map-box">
						<img src="" alt="map">
					</div>
				</div>
			</div>
		</div>
		<div class="area-weather">
			<h2>서울 날씨</h2>
			<div class="area-weather-Info">
				<div class="weather">
					<div class="weather-text"
						style="text-align: center; font-size: 20px; color: rgb(15, 41, 77); font-weight: bold;">오늘</div>
					<div class="weather-day"
						style="text-align: center; font-size: 16px; color: rgb(69, 88, 115); line-height: 22px;">2021년
						12월 3일</div>
					<div class="weather-num-con">
						<div class="weather-num"
							style="font-size: 90px; margin-right: 12px; color: rgb(15, 41, 77);">-5</div>
						<div class="weather-tem-log">
							<div class="log" style="font-size: 50px; color: rgb(15, 41, 77)">º</div>
							<i style="font-size: 40px;"></i>
						</div>
					</div>
					<div class="weather-weather"
						style="text-align: center; font-size: 18px; color: rgb(69, 88, 115); line-height: 24px; font-weight: bold;">구름많음</div>
					<div class="weather-tem"
						style="text-align: center; font-weight: bold; color: rgb(69, 88, 115)">-5~3ºC</div>
				</div>
				<div class="weather">
					<div class="weather-text"
						style="text-align: center; font-size: 20px; color: rgb(15, 41, 77); font-weight: bold;">내일</div>
					<div class="weather-day"
						style="text-align: center; font-size: 16px; color: rgb(69, 88, 115); line-height: 22px;">2021년
						12월 3일</div>
					<div class="weather-num-con">
						<div class="weather-num"
							style="font-size: 90px; margin-right: 12px; color: rgb(15, 41, 77);">-5</div>
						<div class="weather-tem-log">
							<div class="log" style="font-size: 50px; color: rgb(15, 41, 77)">º</div>
							<i style="font-size: 40px;"></i>
						</div>
					</div>
					<div class="weather-weather"
						style="text-align: center; font-size: 18px; color: rgb(69, 88, 115); line-height: 24px; font-weight: bold;">구름많음</div>
					<div class="weather-tem"
						style="text-align: center; font-weight: bold; color: rgb(69, 88, 115)">-5~3ºC</div>
				</div>
				<div class="weather">
					<div class="weather-text"
						style="text-align: center; font-size: 20px; color: rgb(15, 41, 77); font-weight: bold;">모레</div>
					<div class="weather-day"
						style="text-align: center; font-size: 16px; color: rgb(69, 88, 115); line-height: 22px;">2021년
						12월 3일</div>
					<div class="weather-num-con">
						<div class="weather-num"
							style="font-size: 90px; margin-right: 12px; color: rgb(15, 41, 77);">-5</div>
						<div class="weather-tem-log">
							<div class="log" style="font-size: 50px; color: rgb(15, 41, 77)">º</div>
							<i style="font-size: 40px;"></i>
						</div>
					</div>
					<div class="weather-weather"
						style="text-align: center; font-size: 18px; color: rgb(69, 88, 115); line-height: 24px; font-weight: bold;">구름많음</div>
					<div class="weather-tem"
						style="text-align: center; font-weight: bold; color: rgb(69, 88, 115)">-5~3ºC</div>
				</div>
			</div>
			<!-- area-weather-Info -->
		</div>
		<div id="tripmoment" style="display: hidden;"></div>
		<br>
		
		<div class="tripmomentSlide areaSlideTitle">
			<h2 style="font-weight: bold;">
				<span>트립모먼트</span>
			</h2>
			<div class="areaSlide">
				<div id="carousel_tripmoment_slide" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner" id="moment_carousel_inner"></div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carousel_tripmoment_slide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carousel_tripmoment_slide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--areaWrap-->
	<div id="wrap_foot">
		<footer>
			<jsp:include page="../main/main_footer.jsp">
				<jsp:param value="param1" name="param1" />
			</jsp:include>
		</footer>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
	<script type="text/javascript">
	function locationhref(moment_seq) {
    	location.href="/nadri/tripmoment/tripmomentView?moment_seq=" + moment_seq 
    }
	
	//검색
	function searchEnterkey() {
	    if (window.event.keyCode == 13) {
	        if($('.search').val() != "") 
	        $.ajax({
	        	url: '/nadri/area/search',
	        	type: 'get',
	        	data: 'searchText=' + $('.search').val(),
	        	success: function(data) {
	        		if(data.content_seq == '2') location.href="/nadri/main/area?main_seq=" + data.seq;
	        		else if(data.content_seq == '3') location.href="/nadri/area/popular?pop_seq=" + data.seq;
	        		else if(data.content_seq == '5') location.href="/nadri/area/activity?activity_seq=" + data.seq;
	        		else alert('검색어를 제대로 입력 해 주세요');
	        	},
	        	error: function(err) {
	        		console.log(err);
	        	}
	        });
	    }
	}
	
	$(function() {
		
		if($('#memId').val() != 'admin') $('.addButton').hide();
		else $('.addButton').show();
		
		$.ajax({
			url: '/nadri/area/onArea',
			type: 'get',
			data: 'main_seq=' + $('#main_seq').val(),
			success: function(data) {
				num = 0;
				$.each(data, function(index, items){
					$('.areaPathItem').last().text(items.main_name);
					$('#main_name').val(items.main_name);
					$('.areaPathItem:eq(1) > a').text(items.main_name);
					$('#areaDestination_name').text(items.main_name);
					$('.areaSlideTitle:eq(0) h2 > span').text(items.main_name + ' 인기 명소');
					$('.areaInfo h2').text(items.main_name + ' 여행' + ' 정보');
					$('.area-title-text').text(items.main_name + ' 소개');
					$('.area-weather h2').text(items.main_name + ' 날씨');
					if(items.mainImg == 'T')
					$('#areaMainBig').prop("src", "/nadri/repository/img" + "/" + items.img_path + "/" + items.img_name);
					else if(items.mainImg == 'F')
					$('#areaMainSmall img:eq('+ (num++) +')').prop("src", "/nadri/repository/img"+ "/" + items.img_path + "/" + items.img_name);
					else if(items.mainImg == 'M')
					$('.map-box img').prop("src", "/nadri/repository/img" + "/" + items.img_path + "/" + items.img_name);
					$(".area-content-text p").text(items.main_info);
					$("#seoulInfo").text(items.main_info);
				 }); 
				
				$.ajax({
					url: '/nadri/area/getWeatherLocation',
					data: 'main_name=' + $('#main_name').val(),
					success: function(data){
						weather(data.location_x, data.location_y);
					},
					error: function(err) {
						console.log(err);
					}
				});
			},
			error: function(err) {
				console.log(err);
			}
		});
	
    $.ajax({
      url: '/nadri/area/onAreaPop',
      type: 'get',
      data: 'main_seq=' + $('#main_seq').val(),
      success: function(data) {
        var count = -1;
        var popCount = 1;
        
        $.each(data, function(index, items){
          if(index % 4 == 0) {
		
            if(index == 0) {
              $('<div/>', {
                class: 'carousel-item active'
              }).append($('<div/>', {
                class: 'card-group'
              })).appendTo($('#pop-carousel-inner'));
            }else {
              $('<div/>', {
                class: 'carousel-item'
              }).append($('<div/>', {
                class: 'card-group'
              })).appendTo($('#pop-carousel-inner'));
            }
            
            count++;
          }

          $('<div/>', {
            class: 'card'
          }).append($('<div/>', {
              class: 'card_rank',
              text: 'TOP ' + popCount++
            })).append($('<div/>', {
              class: 'slide_img'
            }).append($('<img/>', {
              src: '/nadri/repository/img/' + items.img_path + '/popmain/' + items.img_name,
              class: 'card-img-top',
              alt: 'top1'
            }))).append($('<div/>', {
              class: 'card-body'
            }).append($('<div/>', {
              class: 'pop-title'
            }).append($('<a/>', {
              href: '/nadri/area/popular?pop_seq=' + items.pop_seq + '&main_seq=' + $('#main_seq').val() + '&main_name=' + $('#main_name').val(),
              text: items.pop_name
            }))).append($('<div/>', {
              class: 'pop-review'
            }).append($('<div/>', {
              class: 'pop-review-score'
            }).append($('<span/>', {
              class: 'pop-review-score-current',
              text: items.pop_review_score
            })).append($('<span/>', {
              class: 'pop-review-score-total',
              text: '/5'
            }))).append($('<div/>', {
              class: 'pop-review-text',
              text: items.pop_review_count + '건의 리뷰'
            })))).appendTo($('#pop-carousel-inner .card-group:eq(' + count + ')'));
        });//for each문
      },
      error: function(err) {
        console.log(err);
      }
    });
    
    $.ajax({
    	url: '/nadri/area/onAreaHotel',
    	type: 'get',
    	data: 'main_seq=' + $('#main_seq').val(),
    	success: function(data) {
    		var count = -1;
            var activityCount = 1;
            
            $.each(data, function(index, items){
            	if(index % 4 == 0) {

                    if(index == 0) {
                      $('<div/>', {
                        class: 'carousel-item active'
                      }).append($('<div/>', {
                        class: 'card-group'
                      })).appendTo($('#hotel-carousel-inner'));
                    }else {
                      $('<div/>', {
                        class: 'carousel-item'
                      }).append($('<div/>', {
                        class: 'card-group'
                      })).appendTo($('#hotel-carousel-inner'));
                    }
                    
                    count++;
                  }
                
            	var clean = ((items.hotel_clean / (110/19)).toFixed(2) * 100) + '%;';
                var facility = ((items.hotel_facility / (110/19)).toFixed(2) * 100) + '%;';
                var location = ((items.hotel_location / (110/19)).toFixed(2) * 100) + '%;';
                var service = ((items.hotel_service / (110/19)).toFixed(2) * 100) + '%;';
                
                $('<div/>', {
                	class: 'card hotelCard'  
                  }).append($('<div/>', {
                	  class: 'slide_img'
                  }).append($('<img/>', {
                	  src: '/nadri/repository/img/'+ items.img_path + '/' + items.img_name,
                	  class: 'card-img-top',
                	  alt: '호텔 이미지'
                  }))).append($('<div/>', {
                	  class: 'card-body'
                  }).append($('<div/>', {
                	  class: 'pop-title'
                  }).append($('<a/>', {
                	  text: items.hotel_name
                  }))).append($('<div/>', {
                	  class: 'hotel-score'
                  }).append($('<div/>', {
                	 class: 'hotel-score-item' 
                  }).append($('<div/>', {
                	  class: 'hotel-score-clean',
                	  text: '청결도'
                  })).append($('<div/>', {
                	  class: 'score-bar'
                  }).append($('<span/>', {
                	  class: 'base-bar'
                  }).append($('<span/>', {
                	  class: 'bar',
                	  style: 'width: ' + clean
                  }))))).append($('<div/>', {
                	 class: 'hotel-score-item' 
                  }).append($('<div/>', {
                	  class: 'hotel-score-clean',
                	  text: '호텔 시설'
                  })).append($('<div/>', {
                	  class: 'score-bar'
                  }).append($('<span/>', {
                	  class: 'base-bar'
                  }).append($('<span/>', {
                	  class: 'bar',
                	  style: 'width: ' + facility
                  }))))).append($('<div/>', {
                	 class: 'hotel-score-item' 
                  }).append($('<div/>', {
                	  class: 'hotel-score-clean',
                	  text: '위치'
                  })).append($('<div/>', {
                	  class: 'score-bar'
                  }).append($('<span/>', {
                	  class: 'base-bar'
                  }).append($('<span/>', {
                	  class: 'bar',
                	  style: 'width: ' + location
                  }))))).append($('<div/>', {
                	 class: 'hotel-score-item' 
                  }).append($('<div/>', {
                	  class: 'hotel-score-clean',
                	  text: '서비스'
                  })).append($('<div/>', {
                	  class: 'score-bar'
                  }).append($('<span/>', {
                	  class: 'base-bar'
                  }).append($('<span/>', {
                	  class: 'bar',
                	  style: 'width: ' + service
                  }))))))).appendTo($('#hotel-carousel-inner .card-group:eq(' + count + ')'));
            });//each
    	}
    });
    
     $.ajax({
    	url: '/nadri/area/onAreaActivity',
    	type: 'get',
    	data: 'main_seq=' + $('#main_seq').val(),
    	success: function(data) {
    		var count = -1;
            var activityCount = 1;
            $.each(data, function(index, items){
              if(index % 4 == 0) {

                if(index == 0) {
                  $('<div/>', {
                    class: 'carousel-item active'
                  }).append($('<div/>', {
                    class: 'card-group'
                  })).appendTo($('#activity-carousel-inner'));
                }else {
                  $('<div/>', {
                    class: 'carousel-item'
                  }).append($('<div/>', {
                    class: 'card-group'
                  })).appendTo($('#activity-carousel-inner'));
                }
                
                count++;
              }
              
              $('<div/>', {
            	  class: 'card'
              }).append($('<div/>', {
            	  class: 'card_saleRate',
            	  text: items.activity_saleRate + '% 할인'
              })).append($('<div/>', {
            	  class: 'slide_img'
              }).append($('<img/>', {
            	  src: '/nadri/repository/img/activities/' + items.img_name
              }))).append($('<div/>', {
            	  class: 'card-body'
              }).append($('<div/>', {
            	  class: 'pop-title'
              }).append($('<a/>', {
            	  href: '/nadri/area/activity?activity_seq=' + items.activity_seq,
            	  text: items.activity_name
              }))).append($('<div/>', {
            	  class: 'pop-review'
              }).append($('<div/>', {
            	  class: 'pop-review-score'
              }).append($('<span/>', {
            	  class: 'pop-review-score-current',
            	  text: '3.3'
              })).append($('<span/>', {
            	  class: 'pop-review-score-toral',
            	  text: '/5'
              }))).append($('<div/>', {
            	  class: 'pop-review-text',
            	  text: '3건의 리뷰'
              }))).append($('<div/>', {
            	  class: 'areaActivity_use'
              }).append($('<span/>', {
            	  text: '오늘부터 바로 사용'
              }))).append($('<div/>', {
            	 class: 'price' 
              }).append($('<span/>', {
            	  class: 'price-text',
            	  text: '최저가'
              })).append($('<span/>', {
            	  class: 'price-num',
            	  text: items.price
              })))).appendTo($('#activity-carousel-inner .card-group:eq(' + count + ')'));
              
            });//each
    	},
    	error: function(err) {
    		console.log(err);
    	}
    }); 
    
    
  }); 


	function weather(x, y) {
		function numberPad(n, width) {
	        n = n + '';
	        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	    }

	    var today = new Date();
	    today = "" + today.getFullYear() + numberPad((today.getMonth() + 1), 2) + numberPad(today.getDate(), 2);
	    
	    var serviceKey = 'es31tYgHZ%2BTkuWpOLXBsbxse3oMSoHkjqzhMd0SpKZ4EHParX3%2B0uQq2qhvJMizTi84Ifj1PWHXfIOSLtRhzaA%3D%3D';
	    var dataType = 'JSON';
	    var numOfRows = '773';
	    var pageNo = '1';
	    var base_date = today;
	    var base_time = '0200';
	    var nx = x;
	    var ny = y;

	    $.ajax({
	        url: 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst'
	                + '?serviceKey=' + serviceKey
	                + '&dataType=' + dataType
	                + '&numOfRows=' + numOfRows
	                + '&pageNo=' + pageNo
	                + '&base_date=' + base_date
	                + '&base_time=' + base_time
	                + '&nx=' + nx
	                + '&ny=' + ny,
	        type: 'GET',
	        async: 'false',
	        success: function(data) {
	        	
	            var temp = new Date();
	    		$('.weather:eq(0) .weather-day').text(temp.getFullYear() + "년 " + (temp.getMonth() + 1) + "월 " + numberPad(temp.getDate(), 2) + "일");
	    		$('.weather:eq(1) .weather-day').text(temp.getFullYear() + "년 " + (temp.getMonth() + 1) + "월 " + numberPad(temp.getDate() + 1, 2) + "일");
	    		$('.weather:eq(2) .weather-day').text(temp.getFullYear() + "년 " + (temp.getMonth() + 1) + "월 " + numberPad(temp.getDate() + 2, 2) + "일");
	    		
	    		var tmn;
	    		var tmx;
	    		var num;
	            $.each(data.response.body.items.item, function(index, item){
	            	if(item.fcstDate == today) {num = 0;}
	            	else if(item.fcstDate == (eval(today) + 1) + '') { num = 1;}
	            	else if(item.fcstDate == (eval(today) + 2) + '') { num = 2;}
	            	
	            	
	            	if((item.fcstDate == today || item.fcstDate == (eval(today) + 1) || item.fcstDate == (eval(today) + 2) || item.fcstDate == (eval(today) + 3))) {
	            		if(item.category == "TMN") {
	            			tmn = item.fcstValue;
	            			$('.weather:eq('+num+') .weather-num').text(item.fcstValue);
	            		}else if(item.category == "TMX") {
	            			tmx = item.fcstValue;
	            		}else if(item.category == "SKY" && item.fcstTime == '1400') {
	            			if(item.fcstValue == 1) {
	            				$('.weather:eq('+num+') .weather-weather').text("맑음");
	            				$('.weather:eq('+num+') .weather-tem-log i').removeClass();
	            				$('.weather:eq('+num+') .weather-tem-log i').addClass('bi bi-sun');
	            			}else if(item.fcstValue == 3) {
	            				$('.weather:eq('+num+') .weather-weather').text("구름많음");
	            				$('.weather:eq('+num+') .weather-tem-log i').removeClass();
	            				$('.weather:eq('+num+') .weather-tem-log i').addClass('bi bi-cloud');
	            			}else if(item.fcstValue == 4) {
	            				$('.weather:eq('+num+') .weather-weather').text("흐림");
	            				$('.weather:eq('+num+') .weather-tem-log i').removeClass();
	            				$('.weather:eq('+num+') .weather-tem-log i').addClass('bi bi-cloud-sun');
	            			}
	            		}
	            		
	            		$('.weather:eq('+num+') .weather-tem').text(tmn + "~" + tmx + "ºC");
	            	}
	            }); //each
	            
	            
	        },
	        error: function(err) {
	            console.log(err);
	        }
	    });
	    
	    $.ajax({
			url : '/nadri/tripmoment/onTripmoment',
			type : 'get',
			success : function(data) {
					var count = -1;
			        var momentCount = 1;	

				$.each(data, function(index, items){
					if(index % 4 == 0) {

			            if(index == 0) {
			              $('<div/>', {
			                class: 'carousel-item active'
			              }).append($('<div/>', {
			                class: 'card-group'
			              })).appendTo($('#moment_carousel_inner'));
			            }else {
			              $('<div/>', {
			                class: 'carousel-item'
			              }).append($('<div/>', {
			                class: 'card-group'
			              })).appendTo($('#moment_carousel_inner'));
			            }            
			            count++;
			          }
					
					$('<div>', {
						class: 'cardstyle card index_card_con',
						style: 'cursor: pointer;',
						onclick : 'locationhref('+ items.moment_seq + ')'
					}).append($('<div>', {
						style: '', 
						class: 'slide_img'
					}).append($('<div>', {
						class: 'img'
					}).append($('<img>', {
						src: '/nadri/repository/img/' + items.img_path + '/' + items.img_name,
						class: 'card-img-top',
						alt: '트립1'
					})))).append($('<div>', {
						class: 'bottom_con'
					}).append($('<div>', {
						style: '-webkit-box-orient: vertical', 
						class: 'bottom_desc',
						text: items.moment_content
					})).append($('<div>', {
						class: 'bottom_user_left'
					}).append($('<i>', {
						class: 'bi bi-person-circle'
					})).append($('<span>', {
						text: items.nickname
					})))).appendTo($('#moment_carousel_inner .card-group:eq(' + count + ')'));
				})//each
			},
			error : function(err) {
				
			}
		});
	}
</script>
</body>
</html>