<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script type="text/javascript" src="JS/index.js"></script>
<script>

</script>
<link rel="stylesheet" href="CSS/index.css">
<script type="text/javascript" src="JS/index.js"></script>
</head>
<body>
<%@taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="justify-content:center;">
		  <a class="navbar-brand" href="#" style="font-size:30px;font-weight:600">ToDoAPP</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		</nav>
		<div class="container mt-5 p-3">
			<div id="btns">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><a>Add TODO</a></button>
				 <button type="button" class="btn btn-primary"><a href="ToDoController?flag=show">ShowAll</a></button>
				 <button type="button" class="btn btn-danger" onclick=""><a href="ToDoController?flag=deleteAll">Delete All</a></button>
			</div>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Add Data</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form action="ToDoController" method="post">
			          <div class="form-group">		
			          	<input type="hidden" name="id" id="id">	      
			          	<input type="hidden" name="pass" id="pass">	    
			          	<input type="hidden" value="letsupdate" name="flg">     
			            <input type="email" class="form-control" id="email" name="email" placeholder="example@gmail.com" required>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label"></label>
			            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
			          </div>		
						<div style="display: flex;margin-bottom: 15px;">
							<div class="form-check" style="margin-right: 30px">
					          <input class="form-check-input" type="radio" name="gender" id="radio1" value="M">
					          <label class="form-check-label" for="gridRadios1">
					            male
					          </label>
					        </div>
					        <div class="form-check">
					          <input class="form-check-input" type="radio" name="gender" id="radio2" value="F">
					          <label class="form-check-label" for="gridRadios2">
					            female
					          </label>
				        	</div>   
						</div>       
			          
			          <div class="form-group">
			          	  <input type="number" class="form-control" id="percentage" name="percentage" placeholder="Percentage" onkeyup="gradeGiver()" required>
			          </div>
			          <div class="form-group">
			          	  <input type="text" class="form-control" id="grade" name="grade" placeholder="Grade"  required>
			          </div>
			          
			          <div class="form-group">
			          	  <input type="submit" class="btn btn-primary" value="Add Data">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<div class="container">
				<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Sr No.</th>
				      <th scope="col">Email</th>
				      <th scope="col">Name</th>
				      <th scope="col">Gender</th>
				      <th scope="col">Percentage</th>
				      <th scope="col">Grade</th>
				      <th scope="col">Operation</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:set var="count" value="1" scope="page" />
				    <c:forEach items="${sessionScope.List}" var="i">
					    <tr>
					      <th scope="row"><c:out value="${count}" /></th>
					      <c:set var="count" value="${count + 1}" scope="page"/>
					      <td>${i.email}</td>
					      <td>${i.name}</td>
					      <td>${i.gender}</td>
					      <td>${i.percentage}</td>
					      <td>${i.grade}</td>
					      <td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" data-whatever="@mdo"><a href="ToDoController?flag=update&id=${i.email}">Edit</a></button>
					      	  <button type="button" class="btn btn-danger" ><a href="ToDoController?flag=deleteSingle&id=${i.email}">Delete</a></button>					      	  
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
		</div>
		<%
			session.removeAttribute("List");
		%>
		
					
</body>
</html>