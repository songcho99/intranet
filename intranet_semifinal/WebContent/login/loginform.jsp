
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:::int ranet=6;:::</title>
<%
   String root=request.getContextPath();
   
%>
<meta name="viewport" content="width=device-width; initial-scale=1.0"> 
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=root%>/css/loginform.css" type="text/css">

</head>

<body>

<div id="back3"></div>
<div id="back"><img src="../images/company3.jpg" id="back"></div>
 <div id="back2" align="center"></div>
 
<form action="loginform_action.jsp" method="post" id="frm">
  
   <div id="content" >
   
   	<table>
   		<!-- ------------------logo -------------------------------  -->
	      <tr id="t1">
	      	<td id="t1-1" rowspan="2">
		      <div id="logo" >
		         <ul>
		         	<li style="color: #FF0058; margin-left: 30px;">int</li>
		         	<li style="color: white;">ranet=6;</li>
		         </ul>
		      </div>
		      </td>
	      
	      <!-- --------------------text ------------------------------ -->
				<td id="t1-2">				      
			      <div id="text" >
			         <input type="text" id="id" placeholder="사원번호" name="myid" maxlength="41" ><br>
			         <input type="password" id="pw" name="pass" placeholder="PASSWORD" maxlength="16">
			      </div>
		      	</td>
			
			</tr>
			
		 <!-------------------------- 버튼 ---------------------------->    
		     <tr id="t2">
		     
		     	<td id="t2-2">
			      <div id="link" align="left">
			         <a href="loginreceive.jsp" style="color: 	#289AFF;"><b id="link_ma1"><u>RECIEVE EMPLOYEE NUMBER</u></b></a><br>
			         <a href="loginpwfind.jsp" style="color: 	#289AFF;"><b id="link_ma1"><u>FIND PASSWORD</u></b></a>
			      </div>
			         
			      <div id="btn" >
			         <input type="submit" value="LOGIN" id="btn_lo">
			      </div>
		      
		      </td>
		      
	      	</tr>
   
   
      </table>
   
   
   </div>
   
   
</form>

</body>
</html>














