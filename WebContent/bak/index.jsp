<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Donghoon's Model1 Board - Board_List</title>  <!-- 윈도우 상단에 뜨는 내용! -->
</head>
<body>												<!-- HTML 주내용이 들어가는 부분 -->	
<h1>게시글 리스트</h1>								<!-- 헤드라인 글씨를 표현하는 태그입니다. -->
	<table>											<!-- 표 형싱의 데이터를 표현하는 태그입니다. -->
		<tr>										<!-- 테이블 태그 내에서 행을 정의할때 쓰는 태그입니다. -->
			<th>번호</th>							<!-- 테이블 헤더의 약자로 테이블 태그내에서 강조하고 싶은 컬럼을 나타낼때--> 
			<th>제목</th>										
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>1</td>								<!-- 일반적인 테이블 데이터를 넣을때 쓰는 태그입니다. -->
			<td>본격!</td>
			<td>게시판 짜기</td>
			<td>오늘</td>
			<td>100000</td>
		</tr>
	</table>
	<a href="jsp/write.jsp">글쓰기</a>	
</body>
</html>