<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="JS/index.js"></script>
<link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<%@taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
	<div class="container mt-4" style="width: 500px; padding-top: 30px;border:1px solid black;border-radius: 25px;">
		<div class="alert alert-success" style="text-align:center" role="alert">
			<h4 class="alert-heading">Update Form</h4>
		</div>
		<c:forEach items="${sessionScope.record}" var="i">
		<form action="ToDoController" method="get">
			<div class="form-group">
			<label for="recipient-name" class="col-form-label"> Email</label>
				<input type="hidden" name="id" value="${i.id}">
				<input type="hidden" name="flag" value="updateData"> 
					 <input type="email"
					class="form-control" id="email" name="email"
					value="${i.email}" required>
			</div>
			<div class="form-group">
				<label for="recipient-name" class="col-form-label"> Name</label> <input
					type="text" class="form-control" id="name" name="name"
					 value="${i.name}" required>
			</div>
			<div style="display: flex; margin-bottom: 15px;">
				<div class="form-check" style="margin-right: 30px">
					<input class="form-check-input" type="radio" name="gender"
						id="radio1" value="M" checked> <label class="form-check-label"
						for="gridRadios1"> male </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="radio2" value="F"> <label class="form-check-label"
						for="gridRadios2"> female </label>
				</div>
			</div>

			<div class="form-group">
			<label for="recipient-name" class="col-form-label"> Percentage</label>
				<input type="number" class="form-control" id="percentage"
					name="percentage" onkeyup="gradeGiver()" value="${i.percentage}"
					required>
			</div>
			<div class="form-group">
			<label for="recipient-name" class="col-form-label"> Grade</label>
				<input type="text" class="form-control" id="grade" name="grade"
				  value="${i.grade}" required>
			</div>

			<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Update">
			</div>
		</form>
		</c:forEach>
	</div>
</body>
</html>