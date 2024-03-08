<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<title>대구 코로나 19 확진자 현황</title>
<script src="https://d3js.org/d3.v7.min.js"></script>
</head>

<body>
<%@ include file="../module/top.jsp" %>

<!-- 표 -->
<table class="table" border="1">
	<tr>
		<th width="300">날짜</th>
		<th width="300">확진자수(명)</th>
	</tr>
<%
	String tdate = "";
	int tnum = 0;
	for(int j = 0; j < date.length; j++) {
		tdate = date[j];
		tnum = num[j];
%>
	<tr>
		<td width="300"><%=tdate%></td>
		<td width="300"><%=tnum%></td>
	</tr>
<%
	}
%>
</table>
<h2>▲ 대구 지역 코로나 19 확진자 현황 - 표</h2>

</body>
</html>