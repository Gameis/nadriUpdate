<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--새로 창이 열린것이기때문에 <head> <body> 이런걸 지우면 안된다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	font-size: 8pt;
}
.addressA:link{color:black; text:decoration:none;}
.addressA:visited{color:black; text:decoration:none;}
.addressA:hover{color:cyan; text:decoration:underline;}
.addressA:active{color:black; text:decoration:none;}

</style>
</head>
<body>
<form id="checkPostForm">
	<table id="zipcodeTable" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center" width="100">시도</td>
			<td align="center">
				<select name="sido" id="sido">
					<option>시도선택</option>
					<option value="서울">서울</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="광주">광주</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select>
			</td>
			<td align="center" width="100">시.군.구</td>
			<td align="center"><input type="text" name="sigungu" id="sigungu"/></td>
		</tr>
		
		<tr>
			<td align="center">도로명</td>
			<td colspan="3">
				<input type="text" name="roadname" id="roadname" style="width: 250px;" />
               	<input type="button" id="checkPostSearchBtn" value="검색" />
			</td>
		</tr>
		
		<tr>
			<td align="center">우편번호</td>
			<td align="center" colspan="3">주소</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">


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

</script>
</body>
</html>