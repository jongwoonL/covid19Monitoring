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

<!-- 원형 그래프 -->
<script>
<%
	out.println("var dataset = ["); // 브라우저 쪽으로 <script>안에 들어갈 코드를 출력해줌
	for (int i = 0; i < date.length - 1; i++) {
		if (date[i] != null && num[i] != 0) {
			out.println("{ \"name\": \"" + date[i] + "\", \"value\": " + num[i] + " },");
		}
	}
	
	// 마지막 요소인 경우 + 0인 경우에는 쉼표를 출력하지 않음 + null인 경우에는 마지막 요소 날려버림
	if (date[date.length - 1] != null && num[num.length - 1] != 0) {
		out.println("{ \"name\": \"" + date[date.length - 1] + "\", \"value\": " + num[num.length - 1] + " }");
	}
	out.println("]");
%>

	var width = 2500; // 그래프 넓이
	var height = 2500; // 그래프 높이
	var radius = Math.min(width, height) / 2 - 10;
	
	// 2. SVG 영역 설정
	var svg = d3.select("body").append("svg").attr("width", width).attr("height", height);
	
	var g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	
	//3. 컬러 설정
	var color = d3.scaleOrdinal()
		.range(d3.schemePastel1); // d3.schemePastel1은 푸른 계열의 파스텔톤 컬러 스킴
	
	 // 4. pie 차트 dateset에 대한 함수 설정
	 var pie = d3.pie()
	   .value(function(d) { return d.value; })
	   .sort(null);
	
	 // 5. pie 차트 SVG 요소 설정
	 var pieGroup = g.selectAll(".pie")
	   .data(pie(dataset))
	   .enter()
	   .append("g")
	   .attr("class", "pie");
	
	 arc = d3.arc()
	   .outerRadius(radius)
	   .innerRadius(0);
	
	 pieGroup.append("path")
	   .attr("d", arc)
	   .attr("fill", function(d) { return color(d.index) })
	   .attr("opacity", 0.75)
	   .attr("stroke", "white");
	
	 // 6. pie 차트 텍스트 SVG 요소 설정
	 var text = d3.arc()
	   .outerRadius(radius - 30)
	   .innerRadius(radius - 30);
	
	 pieGroup.append("text")
	   .attr("fill", "black")
	   .attr("transform", function(d) {
	       var pos = text.centroid(d);
	       // 글자 회전 설정 추가
	       return "translate(" + pos + ") rotate(" + angle(d) + ")";
	   })
	.attr("dy", "3")  // dy 값을 조절하여 텍스트 위치 조절
	.attr("font-size", "20px")  // 글자 크기 조절
	.attr("text-anchor", "start")
	.text(function(d) { return d.data.name + ": " + d.data.value + "명";});
	 
	// 7. 회전 각도 계산 함수 추가
	function angle(d) {
		var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
		return a - 180;
	 	}
</script>
<h2>▲ 대구 지역 코로나 19 확진자 현황 - 원</h2>

</body>
</html>