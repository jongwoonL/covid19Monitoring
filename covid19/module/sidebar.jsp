<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table>
	<tr>
		<td>
			<form method="post" action="../visualize/table.jsp">
				<input type="hidden" value="<%=month%>" name="month">
				<input class="button" type="submit" value="표">
			</form>
		</td>
		<td>
			<form method="post" action="../visualize/line.jsp">
				<input type="hidden" value="<%=month%>" name="month">
				<input class="button" type="submit" value="꺾은선">
			</form>
		</td>
		<td>
			<form method="post" action="../visualize/bar.jsp">
				<input type="hidden" value="<%=month%>" name="month">
				<input class="button" type="submit" value="막대">
			</form>
		</td>
		<td>
			<form method="post" action="../visualize/tree.jsp">
				<input type="hidden" value="<%=month%>" name="month">
				<input class="button" type="submit" value="트리">
			</form>
		</td>
		<td>
			<form method="post" action="../visualize/pie.jsp">
				<input type="hidden" value="<%=month%>" name="month">
				<input class="button" type="submit" value="원">
			</form>
		</td>
	</tr>
</table>
