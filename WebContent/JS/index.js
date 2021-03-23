function gradeGiver() {
	var per = Number(document.getElementById("percentage").value)
	var grade = document.getElementById("grade");
	if (per > 100) {
		alert("Enter Proper Percentage")
		document.getElementById("percentage").value = ""
		grade.value="Fail"	
	} else {
		if (per >= 95 && per <= 100) {
			grade.value = "A"
		} 
		else if (per < 95 && per >= 80) {
			grade.value = "B"
		} 
		else if (per < 80 && per >= 60) {
			grade.value = "C"
		} 
		else if (per < 60 && per >= 40) {
			grade.value = "D"
		} 
		else {
			grade.value = "Fail"
		}
//        grade.disabled=true;
	}
}
//function Getdata(x) {
//
//	var email = document.getElementById("email");
//
//	var htp = new XMLHttpRequest();
//
//	htp.onreadystatechange = function() {
//		if (htp.readyState == 4){
//			var flag = htp.responseText;
//			var res = flag.split(",");
//			console.log(res)
//			document.getElementById("email").value=res[0]
//			document.getElementById("name").value=res[1]
//   
//			if(res[2]=="Male")
//			{
//				document.getElementById("radio1").checked=true;
//			}
//			else
//			{
//				document.getElementById("radio2").checked=true;
//			}
//			document.getElementById("grade").value=res[3]
//			document.getElementById("percentage").value=Number(res[4])
//			document.getElementById("id").value=Number(res[5])
//			document.getElementById("pass").value=res[6]
//		}
//	}
//	htp.open("get", "RegisterController?flag=update&id="+x, true);
//	htp.send();
//}
function getData(){

	var search= document.getElementById("search");
	console.log(search.value)

	var htp = new XMLHttpRequest();

	htp.onreadystatechange = function() {
		if (htp.readyState == 4) {
			var flag = htp.responseText;
			
		}
	}
	htp.open("get", "ToDoController?flag=search&name="+search.value, true);
	htp.send();
}
