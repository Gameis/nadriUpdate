<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/nadri/repository/css/tripmoment/tripmomentWriteForm.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<form id="uploadImageForm" class="photos" id="photos">
	<input type="hidden" name="member_seq" value="${member_seq}">
		<div>
			<div class="travel_guide_root_class">
				<div class="PublishMainContainer">
					<div class="PublishCenterContainer ">
						<h1 class="title">트립 모먼트 작성하기</h1>
						<div class="PublishImageContainer publish tripmt">
							<p class="image-warn image-warn-h5">하나 이상의 사진을 추가해주세요.</p>
							<div class="publish-title">사진 업로드</div>
							<p class="sub-title">여행 특징이 담긴 사진을 업로드해주세요.</p>

							<div class="add li h5" id="att_zone">
								<div class="cell"
									data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'>
									<div class="icon-upload">
										<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
											class="bi bi-camera-fill" viewBox="0 0 16 16">
                              			<path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                              			<path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
                              			</svg>
									</div>
									<p class="current-total">
										<input type="file" id="btnAtt" multiple='multiple' name="img[]" class="">

										<!--  -->
										/
										<!--  -->
										20
									</p>

									<!--  <input type="file" multiple name="chooseFile"
                              class="image-upload" accept="img/*" onchange="loadFile(this)" /> -->
								</div>
							</div>

							<p class="image-warn image-warn-online">하나 이상의 사진을 추가해주세요.</p>
						</div>
						<!-- 제목 추가 -->
						<div class="PublishTitleContainer">
							<div class="publish-title">
								제목 추가 <span class="supplement">(필수)</span>
							</div>
							<input type="text" placeholder="제목이 포함된 게시글은 인기글로 선정될 확률이 높아요."
								name="moment_title" id="moment_title" class="moment_title">
							<p class="title-warn title-warn-online">제목을 입력해주세요.</p>
						</div>

						<div class="PublishContentContainer">
							<div class="nadritripmoment publish-title">
								여행 스토리를 공유해주세요! <span class="supplement">(필수)</span>
							</div>
							<div class="nadritripmoment input">
								<textarea id="moment_content"
									placeholder="나만의 여행 스토리를 다른 여행자와 함께 공유해보세요! 특별한 사진을 추가하면 더 많은 여행자들이 볼 수 있어요. (예시 : 여행 팁, 맛집, 카페 등 추천)"
									class="nadritripmoment" contenteditable="true"
									data-tribute="true" name="moment_content"></textarea>
								<div class="nadritripmoment tipsView">
									<span class="nadritripmoment tipsContent">50자 이상 작성 시, </span>
									<span class="nadritripmoment tipsReword"> &nbsp; '최고에요'
										태그 게시물</span> <span class="nadritripmoment tipsContent"> 선정 기회
									</span>
								</div>
							</div>
							<p class="content-warn content-warn-online">내용을 입력해주세요.</p>
						</div>
						<!-- 위치 추가 -->
						<div class="PublishLocationContainer tripmt location-view">
							<div class="location-view-for-online">
								<div class="publish-title">위치 추가</div>
								<div class="location-input false" id="location">
									<i class="input-tips-left">하나 이상의 위치를 선택해주세요.</i> <i
										class="input-tips-right"></i> <input type="text"
										placeholder="위치를 추가해주세요." id="pop_name" name="pop_name">
								</div>
							</div>
							<p class="location-warn location-warn-online">위치를 입력해주세요.</p>
						</div>
						<div class="PublicPrivacyContainer tripmt-pv">
							<div class="agreement">
								<div class="checkbox">
									<input type="hidden" id="checked" value="false"> 
									<img alt="checkbox" src="/nadri/repository/img/main/checkbox.png"
										class="checkbox-icon" id="checkbox"> 
									<img alt="checkbox_checked" src="/nadri/repository/img/main/checkbox_checked.png"
										class="checkbox-icon checkbox_checked" id="checkbox_checked">
									<span class="privacy-text"> 콘텐츠 업로드에 있어서, 트립닷컴의 이용약관에 동의합니다. <a class="protocol"
										href="https://pages.trip.com/m/service-clause-ko-kr.html">이용약관</a>
									</span>
									<p class="privacy-unagree-tips">사용약관 및 개인정보 보호 정책을 읽은 후
										체크박스에 동의해주세요</p>
								</div>
							</div>
						</div>
						<div class="PublishSubmitContainer tripmt-pv">
							<div class="submit">확인</div>
						</div>
					</div>
					<!-- PublishImageContainer -->
				</div>
				<!-- PublishMainContainer -->
			</div>
	</form>
	<!-- footer -->
	<div id="wrap_foot">
		<footer> </footer>
	</div>
	</div>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    window.onload = function(){
       ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
               imageView = function imageView(att_zone, btn){

                 var attZone = document.getElementById(att_zone);
                 var btnAtt = document.getElementById(btn)
                 var sel_files = [];
                 
                 // 이미지와 체크 박스를 감싸고 있는 div 속성
                 var div_style = 'display:inline-block;position:relative;'
                               + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
                 // 미리보기 이미지 속성
                 var img_style = 'width:100%;height:100%;z-index:none';
                 // 이미지안에 표시되는 체크박스의 속성
                 var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                               + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#fff';
               
                 btnAtt.onchange = function(e){
                   var files = e.target.files;
                   var fileArr = Array.prototype.slice.call(files)
                   for(f of fileArr){
                     imageLoader(f);
                   }
                 }             
               
                 // 탐색기에서 드래그앤 드롭 사용
                 attZone.addEventListener('dragenter', function(e){
                   e.preventDefault();
                   e.stopPropagation();
                 }, false)
                 
                 attZone.addEventListener('dragover', function(e){
                   e.preventDefault();
                   e.stopPropagation();
                 }, false)
               
                 attZone.addEventListener('drop', function(e){
                   var files = {};
                   e.preventDefault();
                   e.stopPropagation();
                   var dt = e.dataTransfer;
                   files = dt.files;
                   for(f of files){
                     imageLoader(f);
                   }
                   
                 }, false)
                 
                 /*첨부된 이미리즐을 배열에 넣고 미리보기 */
                 imageLoader = function(file){
                   sel_files.push(file);
                   var reader = new FileReader();
                   reader.onload = function(ee){
                     let img = document.createElement('img')
                     img.setAttribute('style', img_style)
                     img.src = ee.target.result;
                     attZone.appendChild(makeDiv(img, file));
                   }
                   
                   reader.readAsDataURL(file);
                 }
                 
                 /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
                 makeDiv = function(img, file){
                   var div = document.createElement('div')
                   div.setAttribute('style', div_style)
                   
                   var btn = document.createElement('input')
                   btn.setAttribute('type', 'button')
                   btn.setAttribute('value', 'x')
                   btn.setAttribute('delFile', file.name);
                   btn.setAttribute('style', chk_style);
                   btn.onclick = function(ev){
                     var ele = ev.srcElement;
                     var delFile = ele.getAttribute('delFile');
                     for(var i=0 ;i<sel_files.length; i++){
                       if(delFile== sel_files[i].name){
                         sel_files.splice(i, 1);      
                       }
                     }
                     
                     dt = new DataTransfer();
                     for(f in sel_files) {
                       var file = sel_files[f];
                       dt.items.add(file);
                     }
                     btnAtt.files = dt.files;
                     var p = ele.parentNode;
                     attZone.removeChild(p)
                   }
                   div.appendChild(img)
                   div.appendChild(btn)
                   return div
                 }
               }
             )('att_zone', 'btnAtt')
	
 }
</script>
	<script>
	$(function(){
		$("#checkbox").show();
		$('#checkbox_checked').hide();
		
		$('#checkbox').click(function(){
			$('#checkbox').hide();
			$('#checkbox_checked').show();
			$('#checked').val('true');
		});
		
		$('#checkbox_checked').click(function(){
			$('#checkbox').show();
			$('#checkbox_checked').hide();
			$('#checked').val('false');
		});
	});
    $(".submit").click(function() {
        <%--var img[] = $('.image-upload').val(); --%>
        var moment_title = $('#moment_title').val();
        var moment_content = $('#moment_content').val();
        var pop_name = $('#pop_name').val();

        $('.image-warn').css('display', 'none');
        $('.title-warn').css('display', 'none');
        $('.content-warn').css('display', 'none');
        $('.location-warn').css('display', 'none');
        $('.privacy-unagree-tips').css('display', 'none');

        if (!$('#btnAtt').val()) {
           $('.image-warn').css('display', 'block');
        }

        else if (moment_title == "") {
           $('.title-warn').css('display', 'block');
        }

        else if (moment_content == "") {
           $('.content-warn').css('display', 'block');
        }

        else if (pop_name == "") {
           $('.location-warn').css('display', 'block');
        }

        else if ($('#checked').val() == 'false') {
           $('.privacy-unagree-tips').css('display', 'block');
           
        }else {
           var formData = new FormData(
                 $('#uploadImageForm')[0]); //form안에 있는 모든 것
           $.ajax({
              url : '/nadri/tripmoment/tripmoment_writeForm',
              type : 'POST',
              enctype : 'multipart/form-data',
              processData : false,
              contentType : false,
              data : formData,
              success : function() {
                 location.href = '/nadri';
              },
              error : function(err) {
                 console.log(err)
              }
           });
        }
     });
</script>
</body>
</html>