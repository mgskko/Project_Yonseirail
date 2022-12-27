<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>연세 철도 주식회사</title>

</head>
<body>
<div style="border:0 padding-top:2; text-align:center;">
		<h1>Station 검색</h1>
	</br>
	
<form action = "manager_Station_search_list.jsp" method ="get">
<select name="Station">
    <option value="ID">ID</option>
    <option value="Name">Name</option>
    <option value="Address">Address</option>
    <option value="Tel">Tel</option>
    <option value="ManagerName">ManagerName</option>
    <option value="Budget">"Budget"</option>
    <option value="Headquarter_ID">"Headquarter_ID"</option>
</select>

<input type="text" name="search">
<button type="submit">검색</button>

</form>
<br>
<form action = "manager.jsp" method ="get">
			<button type="submit">처음으로 이동</button>
	</form>
	</div>
</body>
</html>