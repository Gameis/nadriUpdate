<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form id="popWriteForm" class="popWriteForm">
    	<input type="hidden" name="content_seq" id="content_seq" value="3"/><br/>
    	<input type="hidden" name="main_seq" id="main_seq" value="${param.main_seq }"/><br/>
        명소이름 : <input type="text" name="pop_name" id="pop_name"/><br/>
        영업시간 : <input type="text" name="pop_businessTime" id="pop_businessTime"/><br/>
        관광시간 : <input type="text" name="pop_tourismTime" id="pop_tourismTime"/><br/>
        전화번호 : <input type="text" name="pop_call" id="pop_call"/><br/>
        주소 : <input type="text" name="address_name" id="address_name" class="address_name" readonly/><br/>
        추가정보소개 : <textarea rows="3" cols="3" name="detailInfo" id="detailInfo"></textarea>
        x : <input type="text" name="map_x" id="map_x" class="map_x" readonly/><br/>
        y : <input type="text" name="map_y" id="map_y" class="map_y" readonly/><br/>
        메인이미지 : <input type="file" name="main_img" id="main_Img"/><br/>
        이미지 : <input type="file" name="img[]" id="img" multiple/><br/>
        <input type="button" id="popWriteBtn" value="작성완료"/>
        <input type="reset" value="다시작성"/>
    </form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/nadri/repository/js/area/area.js"></script>
<script type="text/javascript">
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