<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/nadri/repository/css/tripmember/modifyForm.css">

</head>
<body>
		
<div class="wrapper">

	<div class="wrap">
		<form id="modifyForm">
			<br>
			<div class="modifysubject">
				<span>내이미지수정</span>
			</div>
			
			<div>			
				<div>
					<label for="memberImgBtn">
						<img id="memberImgchange"  src="/nadri/repository/img/tripmember/defaultImg.png"  class="myImg" alt="변경이미지"  
						style="cursor:pointer;">					
					</label>
							
				</div>
				
				<div style="display: none;">
					<input type="file" id="memberImgBtn" class="memberImgchange" name="memberImgchange">	
				</div>
			</div>
					
		</form>
	
		<form id="modifyForm2">
		
			<div class="modifysubject">
				<span>내정보수정</span>
			</div>
		
				<div class="pw_wrap">
					<div class="pwname">비밀번호 변경</div><div id="pwdDiv"></div>
					<div class="pwinputbox">
						<input class="pwinput" type="password"  id="pwd" name="pwd">
					</div>
				</div>
				
				<div class="pwck_wrap">
					<div class="pwckname">비밀번호 확인</div><div id="repwdDiv"></div>
					<div class="pwckinputbox">
						<input class="pwckinput" type="password" id="repwd" name="repwd">
					</div>
				</div>
				
				
				<div class="nick_wrap">
					<div class="nickname">닉네임변경</div><div id="nickDiv"></div>
					<div class="nickinputbox">
						<input class="nickinput" id="nickName" name="nickName">
					</div>
				</div>
					
				<div class="tel_wrap">
					<div class="telname">핸드폰번호변경</div><div id="telDiv"></div>
					<div class="teltext">
						<input class="telinput" id="tel" name="tel"  size="15">
					</div>
				</div>
			
				<div class="email_wrap">
					<div class="emailname">이메일변경</div> <div id="emailDiv"></div>
						<div class="emailtext">
							<input type="text" name="email" id="email" class="emailinputbox">
							<div class="emailcheckbutton" id="emailcheckbutton">
							<span>인증메일전송</span>
						</div>
						</div>
									
					<div class="emailcheck_wrap">
						<div id="emailcheckDiv"></div>
						<div class="emailcheckinputbox">
							<input class="emailcheckinput" id="emailcheck">
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
						
				<div class="address_wrap">
					<div class="addressname">주소변경</div><div id="addressDiv"></div>
					<div class="addressinput1_wrap">
						<div class="addressinput1box">
							<input class="addressinput1" id="zipcode" name="zipcode" readonly>
						</div>
						
						<div class="addressbutton" id="zipcodeBtn">
							<span>우편번호검색</span>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class ="addressinput2_wrap">
						<div class="addressinput2box">
							<input class="addressinput2" placeholder="도로주소" id="address" name="address" readonly>
							
						</div>
					</div>
					
					<div class ="addressinput3_wrap">
						<div class="addressinput3box">
							<input class="addressinput3" placeholder="상세주소" id="addressDetail" name="addressDetail">
							
						</div>
					</div>
				</div>
				
				<div class="modifybutton_wrap">
					<input type="button" class="modifyBtn" id="modifyBtn" value="수정하기">
				</div>		
		</form>
		
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		url: '/nadri/tripmember/getTripmemberInfo',
		type: 'post',
		dataType: 'json',
		success:function(data){
			console.log(JSON.stringify(data));		//json을 안썼지만 json형식으로 뜸 오류가 안뜸
		
			$('#memberImgchange').attr('src', '/nadri/repository/img/tripmember/storage/'+data.profileImg);
			$('#nickName').val(data.nickName);
			$('#tel').val(data.tel);			
			$('#email').val(data.email);
			$('#zipcode').val(data.zipcode);
			$('#address').val(data.address);
			$('#addressDetail').val(data.addressDetail);
				
		},
		error:function(err){
			console.log(err);
		}
		
	});	//ajax		
});	//function		
			
$('#modifyBtn').click(function(){
	$('#pwdDiv').empty();	
	$('#repwdDiv').empty();
	$('#telDiv').empty();
	$('#emailDiv').empty();
	$('#addressDiv').empty();
	
	
 	if($('#pwd').val()==''){
		$('#pwdDiv').html('변경될 비밀번호를 입력해주세요 ');		
	}else if(($('#repwd').val()=='')||($('#pwd').val() != $('#repwd').val())){
		$('#repwdDiv').html('비밀번호를 확인해주세요 ');
	}else if($('#nickName').val()==''){
		$('#nickDiv').html('닉네임을 입력해주세요');
	}else if($('#tel').val()==''){
		$('#telDiv').html('핸드폰번호가 제대로 입력되지 않았습니다');				
 	}else if($('#email').val()==''){	
		$('#emailDiv').html('메일주소가 제대로 입력되지 않았습니다');
	}else if($('#zipcode').val()==''||$('#addr1').val()==''){
		$('#addrDiv').html('주소가 제대로 입력되지 않았습니다');
		
	}else{
		$.ajax({
			url:'/nadri/tripmember/modify',
			type:'post',		
			//enctype: 'multipart/form-data',
			//processData: false,
			//contentType: false,
			data: $('#modifyForm2').serialize(),

			success:function(){
				alert('회원정보가 변경되었습니다 ');
				location.href="/nadri/tripmember/myPage";
			},
			error(err){
				console.log(err);
			}
		});	//ajax
	}	//else	
	
});	//modifyBtn click 


$('.memberImgchange').change(function(){
//시리얼 라이즈로 멀티파트 즉 그림형태는 못넘기는듯
	var formData = new FormData($('#modifyForm')[0]);
//	alert("뜨냐");
	$.ajax({
		url:"/nadri/tripmember/memberImgchange",
		type: 'post',
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		data: formData,
		dataType:'text',
		
		success: function(data) {
			alert('이미지 수정 완료' + data);
			var date=new Date();
			//$('#memberImgchange').attr('src','/nadri/repository/img/tripmember/storage/'+data+'?timestamp='+date.getTime());
			$('#memberImgchange').attr('src','/nadri/repository/img/tripmember/storage/'+data);
			location.reload();
	
		},
		error:function(err){
			console.log(err);
		}
	});		//ajax

});


//우편번호 체크
$('#zipcodeBtn').click(function(){
	window.open("/nadri/repository/jsp/tripmember/checkPost.jsp", "checkPost", "width=500 height=500 top=200 left=700");
});


//현재 새로운창이 떠있는상태
$('#checkPostSearchBtn').click(function(){
	$.ajax({
		url:'/nadri/tripmember/checkPostSearch',
		type:'post',		
		data:$('#checkPostForm').serialize(),
		dataType: 'json',
		
		success:function(data){
			//alert(JSON.stringify(data));
			
			$('#zipcodeTable tr:gt(2)').remove();
			$.each(data, function(index,items){
				var address = items.sido+'  '
							+items.sigungu+'  '
							+items.yubmyundong+'  '
							+items.ri+'  '
							+items.roadname+'  '
							+items.buildingname;	//마지막엔 ; 없어도 됨
							
			address = address.replace(/null/g,''); //null이라는것을 g 글로벌전체에서 찾아서 ''로 바꿔라				
			$('<tr/>').append($('<td/>',{
				align:'center',
				text:items.zipcode
			})).append($('<td/>',{
				colspan:3
			
				}).append($('<a/>',{	//td안에 a태그를 붙임
					href:'#',
					text:address,
					class:'addressA'
				
			}))).appendTo($('#zipcodeTable'));												
		});	//each
		
	
		$('.addressA').click(function(){
			$('#zipcode', opener.document).val($(this).parent().prev().text());
		
			$('#address', opener.document).val($(this).text());
			window.close();		//창만 닫힐뿐 제어권이 사라진게 아니다
			$('#addressDetail', opener.document).focus();
		});		// addressA click
	
			
		},	//success
		
		error:function(err){
			console.log(err);
		}	
			
	});		//ajax
});		//checkPostSearchBtn click


//이메일 인증번호전송
var mailcode = "";
$("#emailcheckbutton").click(function(){
    $("#modifyBtn").attr("disabled",true);

	$('#email1').empty();
	$('#email2').empty();

	if($('#email1').val()==''){
		$('#emailcheckDiv').html('메일주소를 입력해주세요');
	}	
	else if($('#email2').val()==''){
		$('#emailcheckDiv').html('메일주소를 입력해주세요');
	}	

	else{
	  	var email = $("#email1").val()+"@"+$("#email2").val(); //입력한 이메일
		console.log(email);
	   	$.ajax({
	        type:"GET",
	        url:"/nadri/tripmember/emailCheck?email=" + email,

	        
	           success:function(data){
	   	            alert("인증메일을 전송하였습니다");       
	          	 	console.log("data : " + data);
	              	mailcode = data;
	        	},	//success
	        	
	            error:function(err){
					console.log(err);
				}	   
	  });	//ajax
}	//else
});	//click

/* 인증번호 비교 */
$("#emailcheck").blur(function(){		//포커스가 나갔을때

var inputCode = $("#emailcheck").val();        // 사용자가 메일로 받은 입력코드    

	if(inputCode == mailcode){                            // 일치할 경우
  	 	$("#emailcheckDiv").html("메일인증되었습니다.");
   		 $("#modifyBtn").attr("disabled",false);
	} else {                                            // 일치하지 않을 경우
  	  $("#emailcheckDiv").html("인증번호를 다시 확인해주세요.");
	}

});//blur

</script>
</body>
</html>