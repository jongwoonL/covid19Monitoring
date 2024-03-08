<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<link rel="stylesheet" type="text/css" href="../css/style.css">

<div class="container">
	 <img class="covid19" src="../css/covid19.jpg" alt="covid19">
	 <div class="title">대구 코로나19 확진자 현황</div>
</div>

<form method="post" action="#">
<h1>조회 희망 월을 지정하세요</h1>
	<select class="button" name="month">
	<option value="20-02" disabled selected hidden>선택하세요</option>
	<optgroup label="2020년">
		<option value="20-02">2월</option>
		<option value="20-03">3월</option>
		<option value="20-04">4월</option>
		<option value="20-05">5월</option>
		<option value="20-06">6월</option>
		<option value="20-07">7월</option>
		<option value="20-08">8월</option>
		<option value="20-09">9월</option>
		<option value="20-10">10월</option>
		<option value="20-11">11월</option>
		<option value="20-12">12월</option>
	</optgroup>
	<optgroup label="2021년">
		<option value="21-01">1월</option>
		<option value="21-02">2월</option>
		<option value="21-03">3월</option>
		<option value="21-04">4월</option>
		<option value="21-05">5월</option>
		<option value="21-06">6월</option>
		<option value="21-07">7월</option>
		<option value="21-08">8월</option>
		<option value="21-09">9월</option>
		<option value="21-10">10월</option>
		<option value="21-11">11월</option>
		<option value="21-12">12월</option>
	</optgroup>
	<optgroup label="2022년">
		<option value="22-01">1월</option>
		<option value="22-02">2월</option>
		<option value="22-03">3월</option>
		<option value="22-04">4월</option>
		<option value="22-05">5월</option>
		<option value="22-06">6월</option>
		<option value="22-07">7월</option>
		<option value="22-08">8월</option>
		<option value="22-09">9월</option>
		<option value="22-10">10월</option>
		<option value="22-11">11월</option>
		<option value="22-12">12월</option>
	</optgroup>
	<optgroup label="2023년">
		<option value="23-01">1월</option>
	</optgroup>		
	</select>
	<input class="button" type="submit" value="조회">		
</form>

<%@ include file="../module/data.jsp" %>
<%@ include file="../module/sidebar.jsp" %>
