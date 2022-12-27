<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>검색</title>

</head>
<body>
<div style="border:0 padding-top:2; text-align:center;">
		<h1>Train 검색</h1>
	</br>
		
<form action = "manager_Train_search_list.jsp" method ="get">
<select name="Train">
    <option value="ID">ID</option>
    <option value="Type">Type</option>
    <option value="State">State</option>>
</select>

<input type="text" name="search">
<button type="submit">전송</button>

</form>
<br>
<form action = "manager.jsp" method ="get">
			<button type="submit">처음으로 이동</button>
	</form>
	
	</div>
</body>
</html>