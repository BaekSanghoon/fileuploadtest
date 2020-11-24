<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script >
$(document).ready(function(){
	$('#addBtn').click(function(){
		//alert('test');
		let html='<div><input class="boardfile" type="file" name="boardfile"></div>';
		$('#fileinput').append(html);
	});
	
	$('#delBtn').click(function(){
		//fileinput div중에 마지막 자식 지우기
		$('#fileinput').children().last().remove();
	});
	
	$('#submitBtn').click(function(){
		let ck = true;
		$('.boardfile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');
		} else {
			$('#fileuploadForm').submit();
		}
	});
});


</script>
</head>
<body>
	<h1>자료실 입력</h1>
	<form id="fileuploadForm" method="post" 
	enctype="multipart/form-data" action="${pageContext.request.contextPath }/addboard">
	
	<table border="1">
		<tr>
			<td>board_title</td>
			<td><input type="text" name="boardTitle"></td>
		</tr>
		<tr>
			<td>board_content</td>
			<td><textarea name="boardContent" rows="3" cols="50"></textarea></td>
		</tr>
		<tr>
			<td>board_file</td>
			<td>
			<!--  <input type="file" name="boardfile" multiple="multiple">-->
			<div>
				<button type ="button" id="addBtn">파일추가</button>
				<button type ="button" id="delBtn">파일삭제</button>
			</div>
			<div id="fileinput">
				
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" id="submitBtn">submit</button>
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>