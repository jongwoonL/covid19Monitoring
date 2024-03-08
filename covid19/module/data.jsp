<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<%!
	String[] date = null;
	int[] num = null;
	int total = 0; // 월별 전체 확진자수 데이터
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String month = "20-02"; 
	
	if(request.getParameter("month") != null) {
		month = request.getParameter("month"); // 조회 희망 월 top 에서 받아옴
	}
%>

<h1>20<%=month%>월 자료</h1>

<!-- 자료 가져오기 -->
<%
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/covid19";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "select count(*) from covid19 where date between '20" + month + "-01' and '20" + month + "-31' order by date";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		// covid19 테이블에 값이 몇 개 있는지 count 한 다음에 그 결과를 가지고 해당 크기의 배열 생성
		if (rs.next()) {
			date = new String[rs.getInt(1)];
			num = new int[rs.getInt(1)];
		}

		pstmt = conn.prepareStatement(
		"select * from covid19 where date between '20" + month + "-01' and '20" + month + "-31' order by date");
		rs = pstmt.executeQuery();

		int i = 0;
		total = 0; // 전체 확진자수 초기화
		while (rs.next()) {
			String date1 = rs.getString("date");
			date[i] = date1; // 그래프 출력용 데이터 저장(날짜)
			int num1 = rs.getInt("num");
			num[i] = num1; // 그래프 출력용 데이터 저장(확진자수)
			i++;
			total += num1; // 월별 전체 확진자수 데이터	
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) {
			try {
		rs.close();
			} catch (SQLException sqle) {
				
			}
		}
		if (pstmt != null) {
			try {
		pstmt.close();
			} catch (SQLException sqle) {
				
			}
		}
		if (conn != null) {
			try {
		conn.close();
			} catch (SQLException sqle) {
				
			}
		}
	}

%>
<h2>월별 전체 확진자 : <%=total%>명</h2>