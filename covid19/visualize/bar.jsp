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

<!-- 막대 그래프 -->
<script>
<%
	out.println("var dataset = ["); // 브라우저 쪽으로 <script>안에 들어갈 코드를 출력해줌
	for (int i = 0; i < date.length - 1; i++) {
		if (date[i] != null) {
			out.println("{ \"name\": \"" + date[i] + "\", \"value\": " + num[i] + " },");
		}
	}
	
	// 마지막 요소인 경우에는 쉼표를 출력하지 않음 + null인 경우에는 마지막 요소 날려버림
	if (date[date.length - 1] != null) {
		out.println("{ \"name\": \"" + date[date.length - 1] + "\", \"value\": " + num[num.length - 1] + " }");
	}
	out.println("]");
%>

	var width = 2500; // 그래프 넓이
	var height = 800; // 그래프 높이
	var padding = 50; // 스케일 표시용 여백

	// 2. SVG 영역 설정
	var svg = d3.select("body").append("svg").attr("width", width).attr(
			"height", height);

    //  3. 축 스케일(눈금) 설정
    var xScale = d3.scaleBand()
      .rangeRound([padding, width - padding])
      .padding(0.5)
      .domain(dataset.map(function (d) { return d.name; }));

    var yScale = d3.scaleLinear()
      .domain([0, d3.max(dataset, function (d) { return d.value; })])
      .range([height - padding, padding]);

	// 4. 축 표시
	svg.append("g").attr("transform",
			"translate(0," + yScale(0) + ")").call(
			d3.axisBottom(xScale));

	svg.append("g").attr("transform",
			"translate(" + padding + "," + 0 + ")").call(
			d3.axisLeft(yScale));
	

	// 5. 막대 표시
	svg.append("g").selectAll("rect").data(dataset).enter().append("rect")
			.attr("x", function(d) {
				return xScale(d.name);
			}).attr("y", function(d) {
				return yScale(d.value);
			}).attr("width", xScale.bandwidth()).attr("height",
					function(d) {
						return height - padding - yScale(d.value);
					}).attr("fill", "#add8e6");

	// 6. 각 막대 위에 확진자수 값 텍스트 표시
	svg.selectAll("text.value").data(dataset).enter().append("text")
	    .attr("class", "value")
	    .attr("x", function(d) {
	        return xScale(d.name) + xScale.bandwidth() / 2;
	    })
	    .attr("y", function(d) {
	        return d.value >= 0 ? yScale(d.value) - 10 : yScale(d.value) + 20;
	    })
	    .attr("text-anchor", "middle")
	    .attr("alignment-baseline", function(d) {
	        return d.value >= 0 ? "baseline" : "hanging";
	    })
	    .text(function(d) {
	        return d.value + "명"; // 확진자수 값 표시
	    });
</script>
<h2>▲ 대구 지역 코로나 19 확진자 현황 - 막대</h2>

</body>
</html>