<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html> 
<html> 
<head> 
  <title>Contribution Capture</title> 
  
  <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'style.css')}" />
  <g:javascript src="spryMap-2.js"></g:javascript>
  <script type="text/javascript"> 
  window.onload = function() {
  var map = new SpryMap({id : "worldMap",
                         height: 600,
                         width: 1400,
                         startX:0,
                         startY:0,
                         cssClass: "mappy"});
  }
  </script> 
  
  <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'colorbox.css')}" />
  <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
--%><g:javascript  src="jquery-1.4.2.min.js"></g:javascript>
 <g:javascript src="jquery.colorbox.js"></g:javascript>
		
	
		
</head> 
<body> 
<% def n  %>

		<script>
function getSubmitData(picId){
	//alert ("HI"+abc);
	 $.ajax({
		  	  url: "../contributions/retriveData",
			  dataType: 'json',
			 data:"picId="+picId,
			 success:function(data) {

				  //n = data.email
				  //alert (n)
			      document.getElementById("email").innerHTML=data.email
			      document.getElementById("name").innerHTML=data.name
			      document.getElementById("contribution").innerHTML=data.cont
			      document.getElementById("contributionType").innerHTML=data.contType
			      document.getElementById("city").innerHTML=data.city
			      document.getElementById("age").innerHTML=data.age
			      
			      
				      
			      
			       },
			}); 
			
	
}
</script>


<div id="showDetails">
A Total of <% println "${countOfPic}" %> have Made cont from Delhi <br><br>
Email   :<span id="email">abc</span><br>
Name    :<span id="name">abc</span><br>
Contribution Made :<span id="contribution">abc</span><br>
Contribution Type :<span id="contributionType">abc</span><br>
City : <span id="city">abc</span><br>
Age :<span id="age">abc</span><br>

<a href="showView" > go back</a>
</div>



<div class="content"> 
		<%
		picName = "img_swap_on.jpg"
		popUpUrl = ""
		onClickVar = "getSubmitData"
		className = ""
		%>
		
		<div style="width:1800px; height:600px; background:#f5f5f5; " id="worldMap">
	
	<g:each in="${picId.value}" var="pic">
	
	<a  class="${className}" id=${pic}  onmouseover="${onClickVar}(${pic})"> <img src="../images/${picName}" /></a>
	
	</g:each>
	</div>
</div>
	
	
</body> 
</html>