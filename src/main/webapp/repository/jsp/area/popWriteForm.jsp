<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#popWriteDiv {
		display: grid;
		grid-template-columns: 200px 500px;
		grid-template-rows: repeat(11, 1fr);
		align-items: center;
	    justify-content: center;
	    justify-items: center;
	}
</style>
</head>
<body>
    <form id="popWriteForm" class="popWriteForm">
    	<input type="hidden" name="content_seq" id="content_seq" value="3"/><br/>
    	<input type="hidden" name="main_seq" id="main_seq" value="${param.main_seq }"/><br/>
    	<div id="popWriteDiv">
    		<div>명소이름 : </div>
    		<div><input type="text" name="pop_name" id="pop_name"/></div>
    		<div>영업시간 : </div>
	        <div><input type="text" name="pop_businessTime" id="pop_businessTime"/></div>
	        <div>관광시간 : </div>
	        <div><input type="text" name="pop_tourismTime" id="pop_tourismTime"/></div>
	        <div>전화번호 : </div>
	        <div><input type="text" name="pop_call" id="pop_call"/></div>
	        <div>주소 : </div>
	        <div><input type="text" name="address_name" id="address_name" class="address_name" readonly/></div>
	        <div>추가정보소개 : </div>
	        <div><textarea rows="3" cols="3" name="detailInfo" id="detailInfo"></textarea></div>
	        <div>x : </div>
	        <div><input type="text" name="map_x" id="map_x" class="map_x" readonly/></div>
	        <div>y : </div>
	        <div><input type="text" name="map_y" id="map_y" class="map_y" readonly/></div>
	        <div>메인이미지 : </div>
	        <div>
	        	<div id="att_zone" style="display: inline-block; position:relative; z-index: 1; width: 100px; height: 100px;">
	        		<label for="btnAtt"><img style="width: 100%; height: 100%; z-index:none" src=""/></label>
	        	</div>
	        	<div style="display: none;"><input type="file" name="main_img" id="btnAtt"/></div>
	        </div>
	        <div>이미지 : </div>
	        <div><div id="image_container"></div><input type="file" name="img[]" id="img" multiple/></div>
	        <div>
		        <input type="button" id="popWriteBtn" value="작성완료"/>
		        <input type="reset" value="다시작성"/>
	        </div>
        </div>
    </form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
<script type="text/javascript">

$('#btnAtt').change(function(e){

		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = document.createElement("img");
			$('#att_zone img').prop('src', event.target.result);
		}
	
		reader.readAsDataURL(e.target.files[0]);
});

$('#img').change(function(e){
	var div_style = "display: inline-block; width: 100px; height: 100px;"
	for(var image of e.target.files) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var div = document.createElement("div");
			var img = document.createElement("img");
			div.setAttribute("style", div_style);
			img.setAttribute("src", event.target.result);
			img.setAttribute("style", "width: 100%; height: 100%;")
			div.append(img);
			$('#image_container').append(div);
		};
		
		reader.readAsDataURL(image);
	}
	
	$('#img').hide();
});

$('#pop_name').focusout(function(){
    var location_name = $('#pop_name').val();

    $.ajax({
        type: 'get',
        url: 'https://dapi.kakao.com/v2/local/search/keyword.json',
        headers: { 'Authorization': 'KakaoAK 32efaa6ae080dc2a02583db85d1065eb' },
        data: { 'query': location_name},
        success: function(data){
            var address_name = data.documents[0].address_name;
            var map_x = data.documents[0].x; 
            var map_y = data.documents[0].y;
            
            /* alert(address_name);
            alert(map_x);
            alert(map_y); */
            
            $('input[name="address_name"]').attr('value', address_name);
            $('input[name="map_x"]').attr('value', map_x);
            $('input[name="map_y"]').attr('value', map_y);
                        
        },
        error: function(err){
            console.log(err);
        }
    });
});
</script>
</body>
</html>