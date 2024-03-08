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

<!-- 트리맵 -->
<script>
	// 트리맵에 사용할 데이터 예시
	var data = {
	  name: "Root",
<%
	out.println("children: ["); // 브라우저 쪽으로 <script>안에 들어갈 코드를 출력해줌
	for (int i = 0; i < date.length - 1; i++) {
		if (date[i] != null && num[i] != 0) {
			out.println("{ name: \"" + date[i] + "\", value: " + num[i] + " },");
		}
	}
	
	// 마지막 요소인 경우에는 쉼표를 출력하지 않음
	if (date[date.length - 1] != null && num[num.length - 1] != 0) {
		out.println("{ name: \"" + date[date.length - 1] + "\", value: " + num[num.length - 1] + " }");
	}
	out.println("]");
%>
	};
	
	// 트리맵의 크기 설정
	var width = 2500;
	var height = 1800;
	
	// D3.js의 트리맵 레이아웃 생성
	var treemap = d3.treemap().size([width, height]);
	
	// 데이터를 트리맵에 맞게 변형
	var root = d3.hierarchy(data).sum(function(d) {
	  return d.value;
	});
	
	// 트리맵 레이아웃에 데이터 적용
	treemap(root);
	
	// SVG 요소 생성
	var svg = d3.select("body").append("svg")
	  .attr("width", width)
	  .attr("height", height);
	
    // 파스텔톤으로 연한 블루색상을 만드는 함수
    function getPastelBlue(t) {
      return d3.interpolate("lightblue", "steelblue")(t);
    }
	
	// 트리맵의 각 사각형을 그리기
	svg.selectAll("rect")
	  .data(root.leaves())  // 말단 노드만 선택
	  .enter().append("rect")
	  .attr("x", function(d) { return d.x0; })
	  .attr("y", function(d) { return d.y0; })
	  .attr("width", function(d) { return d.x1 - d.x0; })
	  .attr("height", function(d) { return d.y1 - d.y0; })
      .style("fill", function(d) {
        // 크기에 따라 파스텔 블루색상 적용
        return getPastelBlue(d.value / d3.max(root.leaves(), function(d) { return d.value; }));
      })
	  .style("stroke", "white");
	
	// 각 사각형에 텍스트 추가
	svg.selectAll("text")
	  .data(root.leaves())
	  .enter().append("text")
	  .attr("x", function(d) { return d.x0 + 5; })
	  .attr("y", function(d) { return d.y0 + 15; })
	  .text(function(d) { return d.data.name + ": " + d.data.value + "명";})
	  .attr("font-size", "15px")
	  .attr("fill", "white");
</script>
<h2>▲ 대구 지역 코로나 19 확진자 현황 - 트리맵</h2>

</body>
</html>