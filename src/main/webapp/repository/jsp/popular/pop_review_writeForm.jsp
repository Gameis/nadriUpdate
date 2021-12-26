<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div name="reviewContainer" id="reviewContainer" class="reviewContainer">
	<div class="reviewHeaderContainer">
		<div class="review-box">
			<div>
				<div class="review-title">리뷰 작성하기</div>
				<div class="reivew-tip">
					<span name="tip-text" class="tip-text">
						
					</span>
				</div>
			</div>
		</div><!-- review-box -->
	</div><!-- reviewHeaderContainer -->
	
	<div class="review-writeContainer">
		<ul class="review-write-list">
			<div class="review-write-form">
				<li class="review-write-detail">
				
					<div class="review-write-user">
						<a style="color: rgb(15, 41, 77); text-decoration: none;">
							<img class="review-write-userImg" alt="user_icon" width="50" height="50" src="/nadri/repository/img/tripmember/defaultImg.png">
						</a>
						<div class="review-write-userInfo">
							<div class="reivew-write-userName">
								nickName
							</div><!-- reivew-write-userName -->
						</div><!-- review-write-userInfo -->
					</div><!-- review-write-user -->
					
					<div class="review-write-content">
						<form id="pop_review_writeForm">
							<input type="hidden" id="main_seq" name="main_seq" value="99">
							<input type="hidden" id="content_seq" name="content_seq" value="3"/>
							<input type="hidden" id="pop_seq" name="pop_seq" value="${param.pop_seq }"/>
							<!-- 평점 -->
							<div class="review-write-wrap">
							    <div class="review-write-selectScore">
							    	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio5" value=5 checked>
										<label class="score btn btn-outline-primary" for="btnRadio5">5점</label>
										
										<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio4" value=4 >
										<label class="score btn btn-outline-primary" for="btnRadio4">4점</label>
											
										<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio3" value=3 >
										<label class="score btn btn-outline-primary" for="btnRadio3">3점</label>
										  
										<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio2" value=2 >
										<label class="score btn btn-outline-primary" for="btnRadio2">2점</label>
										  
										<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio1" value=1 >
										<label class="score btn btn-outline-primary" for="btnRadio1">1점</label>
									</div>
								</div><!-- review-write-selectScore -->
							</div>
							
							<!-- 내용 -->
							<div class="review-write-wrap">
								<div class="input-group">
								  <span class="input-group-text">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</span>
								  <textarea class="form-control" name="pop_review_content" aria-label="With textarea" style="resize: none;"></textarea>
								</div>
							</div>
							
							<!-- 파일업로드 -->
							<div class="input-group mb-3">
							  <input type="file" class="form-control" id="inputGroupFile02" name="img[]" multiple>
							  <label class="input-group-text" for="inputGroupFile02">Upload</label>
							</div>
							
							<button id="pop_review_writeBtn" type="button" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-primary">다시작성</button>
							
						</form>
					</div><!-- review-write-content -->
				</li><!-- review-write-detail -->
			</div><!-- review-write-form -->
		</ul><!-- review-write-list -->
	</div><!-- review-writeContainer -->
	
	
	<div class="contentContainer">
		<div class="reviewHeaderContainer">
			<div class="review-box">
				<div>
					<div class="review-title">리뷰</div>
				<div class="reivew-tip">
					<span class="tip-text">
						<i class="bi bi-info-circle"></i>
						"리뷰 일부분은 구글 번역기로 번역되어 보일 수 있습니다"
					</span>
				</div>
				</div>
			</div><!-- review-box -->
		</div><!-- reviewHeaderContainer -->
		
		<div class="switch-container">
			<div class="switch-sort">
				<span class="sort-get-score">avg_score</span>
				<span class="sort-all-score">/5</span>
				<span class="sort-get-catergory">avg_score_content</span>
			</div><!-- switch-sort -->
		
		
			<div class="switch-list-container">
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				  <label id="btnradio1" class="btn btn-outline-primary" for="btnradio1">모두 보기 (total_review)</label>
				  
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				  <label id="btnradio2" class="btn btn-outline-primary" for="btnradio2">최신순</label>
					
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
				  <label id="btnradio3" class="btn btn-outline-primary" for="btnradio3">긍정적 (total_positiveReview)</label>
				  
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
				  <label id="btnradio4" class="btn btn-outline-primary" for="btnradio4">부정적 (total_negativeReview)</label>
				  
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
				  <label id="btnradio5" class="btn btn-outline-primary" for="btnradio5">사진 (total_photo)</label>
				</div>
			</div><!-- switch-list-container -->
		</div><!-- switch-container -->
		
		<div class="reviewItemContainer" style="display: block">
			<ul class="review-comment-list">
				<div id="review-comment-detail" class="review-comment-detail">
					
					<!-- 어펜드시점 -->
					<li id="reviewCommentDetail" class="reviewCommentDetail" style="border-top: 1px solid rgb(218, 223, 230)">
						<div class="review-user-view">
							<a style="color: rgb(15, 41, 77);">
								<img class="review-user-img" alt="user_icon" width="50" height="50" src="https://cdn.pixabay.com/photo/2021/10/15/21/11/squid-game-6713440_1280.jpg">
							</a>
							<div class="review-user-info">
								<div class="reivew-user-name">
									user_name
								</div><!-- reivew-user-name -->
							</div><!-- review-user-info -->
						</div><!-- review-user-view -->
						
						<div class="review-content-detail">
							<div class="review-switch-sort">
								<span class="review-score">5</span>
								<span class="review-all-score">/5</span>
								<span class="review-score-name">완벽해요!</span>
							</div><!-- review-switch-sort -->
							
							<div class="review-content-view">
								<p class="review-content-text">
									명동 대림동 차이나타운 둘 다 유명한 명소..환전하러 명동 나갔다가 장마라서 비가 엄청 내렸지만 비오는 명동도 엄청 운치 있었어요~^^ 이젠 비도 그치고 서울 근교나 휴가 때 갈 명소를 트립 어플 찾는 중이네요ㅎ
								</p><!-- review-content-text -->
							</div><!-- review-content-view -->
							
							<div class="review-content-photolist">
								<div class="review-content-photowall">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100rhk133vw1j9gvl22D6_C_240_240.jpg_.webp?proc=source%2ftrip">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100rhk133vw1j9gvl22D6_C_240_240.jpg_.webp?proc=source%2ftrip">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100fhk124fsod6xfk7FC5_C_240_240.jpg_.webp?proc=source%2ftrip">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100ghk133vw1j9olc81B4_C_240_240.jpg_.webp?proc=source%2ftrip">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100jhk114zpb7469sA015_C_240_240.jpg_.webp?proc=source%2ftrip">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100hhk114zpb7469t5DFE_C_240_240.jpg_.webp?proc=source%2ftrip">
									<img alt="명동 여행 사진" src="https://ak-d.tripcdn.com/images/100khk124fsod6xfl4722_C_240_240.jpg_.webp?proc=source%2ftrip">
								</div><!-- review-photo-wall -->
							</div><!-- review-photo-list -->
							
							<div class="review-content-date">
								<span class="review-content-time">
									<span>작성일 : 2021년 12월 4일</span>
								</span>
							</div>
						</div><!-- review-content-detail -->
					</li><!-- reviewCommentDetail -->
					<!-- 어펜드종점 -->
					
				</div><!-- review-comment-detail -->
			</ul><!-- review-comment-list -->
		</div><!-- reviewItemContainer -->
		<!-- 페이징처리 -->
	    <div id="page-selection"></div>
	       
	</div><!-- contentContainer -->
</div><!-- reviewContainer -->