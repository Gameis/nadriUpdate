<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/nadri/repository/css/tripmember/getTripmember.css">

</head>
<body>
	
<div class="wrapper">

	<form id="getTripmemberForm">
		<div class="wrap">
		
			<div class="mysubject">
				<span>내정보확인</span>
			</div>
			
			<div class="profile_wrap">
	
				<span id="first" class="span">내이미지</span>
				 <span id="profileImgsize"">
				 	<img id="profileImg" src="/nadri/repository/img/tripmember/storage/defaultImg.png" alt="기본이미지" style="cursor:pointer;">
				</span>	
	<!-- 				<input type="file" class="profileImg" name="profileImg">
 -->				
			</div>
	
			
			<div class="name_wrap">
				<span class="span">이름</span>
				<span class="nameinputbox">
					<input class="nameinput" type="text"  id="nameinput" name="nameinput" readonly>
				</span>					
			</div>
			
			<div class="id_wrap">
				<span class="span">아이디</span>
				<span class="idinputbox">
					<input class="idinput" type="text" id="idinput" name="idinput" readonly>
				</span>						
			</div>
						
			<div class="nick_wrap">
				<span class="span">닉네임</span>
				<span class="nickinputbox">
					<input class="nickinput" type="text" id="nickinput" name="nickinput" readonly>
				</span>						
			</div>
				
			<div class="tel_wrap">
				<span class="span">핸드폰번호</span>
				<span class="telinputbox">
					<input class="telinput"  type="text" name="telinput"  id="telinput"  readonly>
				</span>
			</div>
		
			<div class="email_wrap">
				<span class="span">이메일</span> 
				<span class="emailinputbox">
					<input class="emailinput" type="text" name="emailinput" id="emailinput" readonly >
				</span>
			</div>
					
			<div class="address_wrap">
				<span class="span">주소지</span>
				<span class="addressinputbox1">
					<input class="addressinput1" type="text" id="addressinput1" name="addressinput1" readonly>
				</span>
			</div>	
				
			<div class="address2-wrap">
				<span class="span">상세주소</span>
				<span class ="addressinputbox2">
					<input class="addressinput2" type="text" id="addressinput2" name="addressinput2" readonly>
				</span>
			</div> 

		<!-- 					
			<div class="rank-wrap">
				<span class="span">회원등급</span>
				<span class="rankinputbox">
					<input class="rankinput" type="text" name="rankinput" id="rankinput" readonly>
				</span>
			</div> 
		-->
			
			<div class="date-wrap">
				<span class="span">가입일</span>
				<span class="dateinputbox">
					<input class="dateinput" type="text" name="dateinput" id="dateinput" readonly>
				</span>
			</div>	
		
		</div>
	</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		
		url: '/nadri/tripmember/getTripmemberInfo',
		type: 'post',
		dataType: 'json',
		success:function(data){
			console.log(JSON.stringify(data));	
		
			$('#profileImg').attr('src', '/nadri/repository/img/tripmember/storage/'+data.profileImg);
			$('#nameinput').val(data.name);
			$('#idinput').val(data.id);
			$('#nickinput').val(data.nickName);
			$('#emailinput').val(data.email);
			$('#telinput').val(data.tel);
			if(data.zipcode != null) {
				$('#addressinput1').val(data.zipcode+"  "+data.address);
				$('#addressinput2').val(data.addressDetail);				
			}
			
			$('#dateinput').val(data.logtime);

		},	//success
		error:function(err){
			console.log(err);
		}
	
	});	//ajax
});	//function

/*
$('#memberImg').click(function(){
	$.ajax({
		url:"/nadri/tripmember/memberImg",
		type:'post',	
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
});
	
*/	
	
</script>
</body>
</html>