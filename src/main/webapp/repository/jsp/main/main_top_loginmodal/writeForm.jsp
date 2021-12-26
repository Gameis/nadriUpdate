<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/nadri/repository/css/tripmember/writeForm.css">
</head>
<body>

<div class="wrapper">
	<form id="writeForm">
	<div class="wrap">
			<div class="subject">
				<span>회원가입</span>
			</div>
			
			<div class="user_wrap">
				<div class="username">이름</div><div id="nameDiv"></div>
				<div class="userinputbox">
					<input class="userinput" id="name" name="name">
				</div>
			</div>
			<div class="id_wrap">
				<div class="idname">아이디</div><div id="idDiv"></div>
				<div class="idinputbox">
					<input class="idinput" id="id" name="id">
				</div>
			</div>
			
			<div class="pw_wrap">
				<div class="pwname">비밀번호</div><div id="pwdDiv"></div>
				<div class="pwinputbox">
					<input class="pwinput" type="password" id="pwd" name="pwd">
				</div>
			</div>
			
			<div class="pwck_wrap">
				<div class="pwckname">비밀번호 확인</div><div id="repwdDiv"></div>
				<div class="pwckinputbox">
					<input class="pwckinput" type="password" id="repwd" name="repwd">
				</div>
			</div>
			
			<div class="nick_wrap">
				<div class="nickname">닉네임</div><div id="nickDiv"></div>
				<div class="nickinputbox">
					<input class="nickinput" id="nickName" name="nickName">
				</div>
			</div>
	
			
	
		
			<div class="profile_wrap">
				<div class="imgname"></div>
				<div class="imginput_box">
					<input type="hidden" class="imginput" id="profileImg" name="profileImg" value="defaultImg.png">
				</div>
			</div>
	


				
			<div class="tel_wrap">
				<div class="telname">핸드폰</div><div id="telDiv"></div>
				<div class="teltext">
					<select name="tel1" class="tel1" id="tel1">
						<option value="010" selected>010</option>
						<option value="011" >011</option>
						<option value="019" >019</option>
					</select>
					-
					<input class="telinput" id="tel2" name="tel2"  size="6" maxlength="4">
					-
					<input class="telinput" id="tel3" name="tel3"  size="6" maxlength="4">
				</div>
			</div>
	
	
			<div class="email_wrap">
				<div class="emailname">이메일</div> <div id="emailDiv"></div>
					<div class="emailtext">
						<input type="text" name="email1" id="email1" class="emailinputbox">
						@
						<input type="text" name="email2" id="email2" list="email2" class="emailinputbox" placeholder="직접입력">
						<datalist id="email2">
							<option value="naver.com">naver.com
							<option value="daum.net">daum.net
							<option value="gmail.com">gmail.com
						</datalist>
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
				<div class="addressname">주소</div><div id="addressDiv"></div>
				<div class="addressinput1_wrap">
					<div class="addressinput1box">
						<input class="addressinput1" id="zipcode" name="zipcode">
					</div>
					
					<div class="addressbutton" id="zipcodeBtn">
						<span>우편번호검색</span>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class ="addressinput2_wrap">
					<div class="addressinput2box">
						<input class="addressinput2" placeholder="도로주소" id="address" name="address">
						
					</div>
				</div>
				
				<div class ="addressinput3_wrap">
					<div class="addressinput3box">
						<input class="addressinput3" placeholder="상세주소" id="addressDetail" name="addressDetail">
						
					</div>
				</div>
			</div>
			
			<div class="memberbutton_wrap">
				<input type="button" class="memberbutton" id="writeBtn" value="가입하기">
			</div>
			
		</div>
	</form>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

//회원가입
var emailcode = "";
var count =0;
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#nickDiv').empty();
	$('#emailDiv').empty();		
	$('#emailcheckDiv').empty();
	
	if($('#name').val()==''){
		$('#nameDiv').html('이름을 입력해주세요');
	
	}else if($('#id').val()==''){
		$('#nameDiv').html('');		
		$('#idDiv').html('아이디를 입력해주세요');
			
	}else if($('#pwd').val()==''){
		$('#idDiv').html('');		
		$('#pwdDiv').html('비밀번호를 입력해주세요 ');
	
	}else if(($('#repwd').val()=='')||($('#pwd').val() != $('#repwd').val())){
		$('#pwdDiv').html('');
		$('#repwdDiv').html('비밀번호를 확인해주세요 ');
			
	}else if($('#nickName').val()==''){
		$('#repwdDiv').html('');
		$('#nickDiv').html('닉네임을 입력해주세요');

	}else if($('#tel1').val()==''||$('#tel2').val()==''||$('#tel3').val()==''){
		$('#telDiv').html('핸드폰번호가 제대로 입력되지 않았습니다');	
		
	}else if($('#email1').val()==''||$('#email2').val()==''){
		$('#emailDiv').html('이메일을 입력해주세요');

	}else if($('#emailcheck').val()==''){
		$('#emailDiv').html('메일인증을 받아주세요');

	}else if(count==0){
			$("#emailcheckDiv").html("인증번호를 확인해주세요.");		

	}else if(count==1){
		$.ajax({
			url:'/nadri/tripmember/write',
			type:'post',
			data:$('#writeForm').serialize(),

			success(){
				alert('회원가입이 완료되었습니다 ');
				location.href='/nadri/index.jsp';				
			},	//success
			error(err){
				console.log(err);
			}
		});	//ajax
		
	}	//else if
	
});		//click

//인증메일보내기버튼
$("#emailcheckbutton").click(function(){
	$('#email1').empty();
	$('#email2').empty();

	if($('#email').val()==''){
		alert('메일주소를 입력해주세요');
	}	
	else{
		$('#emailDiv').html('');

	  	var email = $("#email1").val()+"@"+$("#email2").val(); //입력한 이메일
		console.log(email);
	   	$.ajax({
	        type:"GET",
	        url:"/nadri/tripmember/emailCheck?email=" + email,

	        
	           success:function(data){
	   	            alert("인증메일을 전송하였습니다");       
	          	 	console.log("data : " + data);
	             $("#emailcheck").attr("disabled",false);
	             $(".emailcheckinputbox").attr("id", "emailchecktrue"); 
	              	emailcode = data;
	        	},	//success
	        	
	            error:function(err){
					console.log(err);
				}	   
	  });	//ajax
  }	//else
});	//click

//인증메일확인
$("#emailcheck").focusout(function(){		//포커스가 나갔을때
		var inputCode = $("#emailcheck").val();   

	if(inputCode == emailcode){                            // 일치할 경우
		$("#emailcheckDiv").html("메일인증되었습니다.");
		count=1;
	}else {                                            // 일치하지 않을 경우
	$("#emailcheckDiv").html("인증번호를 다시 확인해주세요.");
/* 	$("#emailcheckDiv").css("color:red;"); */
	
	}
});	//focusout	
	
//아이디 중복체크
$('#id').focusout(function(){
	$('#idDiv').empty();

	if($('#id').val()==''){
		$('#idDiv').html('아이디를 입력해주세요');
	}else{
		$.ajax({
			url:"/nadri/tripmember/checkId",
			type:'post',
			data:'id='+$('#id').val(),	//json타입형식 {'id':$('#id').val()}

			dataType:'text',
			success:function(data){
				if(data=='exist'){
					$('#idDiv').text("사용이 불가능합니다");
				}else if(data=='non-exist'){
					$('#idDiv').text('사용이 가능합니다');
				}		
			},	
			error:function(err){
				console.log(err);
			}
		});		//ajax
	}		//else
});		//focusout

//닉네임 중복체크
$('#nickName').focusout(function(){
	$('#nickDiv').empty();

	if($('#nickName').val()==''){
		$('#nickDiv').html('닉네임을 입력해주세요');
	}else{
		$.ajax({
			url:"/nadri/tripmember/checkNickName",
			type:'post',
			data:'nickName='+$('#nickName').val(),	
			dataType:'text',
			success:function(data){
				if(data=='exist'){
					$('#nickDiv').text("사용이 불가능합니다");
				}else if(data=='non-exist'){
					$('#nickDiv').text('사용이 가능합니다');
				}		
			},	
			error:function(err){
				console.log(err);
			}
		});		//ajax
	}		//else
});		//focusout

//우편번호 체크
$('#zipcodeBtn').click(function(){
	window.open("/nadri/repository/jsp/tripmember/checkPost.jsp", "checkPost", "width=500 height=500 top=200 left=700");
});

</script>
</body>
</html>
