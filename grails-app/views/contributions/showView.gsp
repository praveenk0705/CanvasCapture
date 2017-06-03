<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html> 
<html> 
<head> 
  <title>Contribution Capture</title> 
  
  <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'style.css')}" />
 
  
  <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'colorbox.css')}" />
  <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
--%><g:javascript  src="jquery-1.4.2.min.js"></g:javascript>
 <g:javascript src="jquery.colorbox.js"></g:javascript>
		
		<script>
			$(document).ready(function(){
				//Examples of how to assign the ColorBox event to elements
				$(".group1").colorbox({rel:'group1'});
				$(".group2").colorbox({rel:'group2', transition:"fade"});
				$(".group3").colorbox({rel:'group3', transition:"none", width:"75%", height:"75%"});
				$(".group4").colorbox({rel:'group4', slideshow:true});
				$(".ajax").colorbox();
				$(".youtube").colorbox({iframe:true, innerWidth:425, innerHeight:344});
				$(".vimeo").colorbox({iframe:true, innerWidth:500, innerHeight:409});
				$(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});
				$(".inline").colorbox({inline:true, width:"50%"});
				
				$(".callbacks").colorbox({
					onOpen:function(){ alert('onOpen: colorbox is about to open'); },
					onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
					onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
					onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
					onClosed:function(){ alert('onClosed: colorbox has completely closed'); }
				});

				$('.non-retina').colorbox({rel:'group5', transition:'none'})
				$('.retina').colorbox({rel:'group5', transition:'none', retinaImage:true, retinaUrl:true});
				
				//Example of preserving a JavaScript event for inline calls.
				$("#click").click(function(){ 
					$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
					return false;
				});
			});
		</script>
		
		
		
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
			      document.getElementById("#inline#name1").value=data.email
			      
			      
				      
			      
			       },
			}); 
			
	
}
</script>
<script type="text/javascript">

function cityfunc(){
	
	//alert("in city")
	 if(document["capturecity"]["city"].checked){
	 document.getElementById("cityfield").style.visibility="visible"
	 }
	 else{
	 document.getElementById("cityfield").style.visibility="hidden"
	 }
	 

	}
function agefunc(){
	
	//alert("in age")
	 if(document["captureage"]["age"].checked){
	 document.getElementById("agefield").style.visibility="visible"
	 }
	 else{
	 document.getElementById("agefield").style.visibility="hidden"
	 }
	 

	}

</script>

<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
 </g:if>
 <div id="showdivFirst">
<div id="showDetails">
Email   :<span id="email">abc</span><br>
Name    :<span id="name">abc</span><br>
Contribution Made :<span id="contribution">abc</span><br>
Contribution Type :<span id="contributionType">abc</span><br>
City : <span id="city">abc</span><br>
Age :<span id="age">abc</span><br>
</div>

<div id="showFrom">
<h1>Customized View</h1> 
<form action="getCity" method="POST" id="capturecity" name="capturecity">
<input id="city" name="city" type="checkbox" value="1" value="ON"  onclick = "cityfunc()" /> Contributions based On City
<span id="cityfield" style="visibility: hidden">
&nbsp;&nbsp;&nbsp;&nbsp;Choose your city 
<select  id="cityname" name="cityname" title="City" required="required">
<option value="">--Select--</option>
<option value="Mumbai">Mumbai</option> 
<option value="Bangalore">Bangalore</option> 
<option value="Chennai">Chennai</option> 
<option value="Kolkata">Kolkata</option>
<option value="Delhi">Delhi</option> 
</select>
<input type = "submit" value="submit">
</span>
</form>

<form action="getAge" method="POST" id="captureage" name="captureage">

<input id="age" name="age" type="checkbox" value="1" value="ON"  onclick = "agefunc()" /> Contributions Based on Age

<span id="agefield" style="visibility: hidden">
&nbsp;&nbsp;&nbsp;&nbsp;Choose your city 
<select  id="agerange" name="agerange" title="Age" required="required">
<option value="">--Select--</option>
<option value="10-20">10-20</option> 
<option value="20-25">20-25</option> 
<option value="25-30">25-30</option> 
<option value="30-35">30-35</option>
<option value="25-45">35-45</option> 
</select>
<input type = "submit" value="submit">
</span>
</form>

</div>
</div>

	

<div class="content"> 
		
		
		<div style=" " id="worldMap">
	<%def i = 0  %>	
	<g:while test="${i < 400}">
    
		
		
		<g:if test="${picId.contains(i)}" >
		<%
		picName = "img_swap_off.png"
		popUpUrl = "y"
		onClickVar = "getSubmitData"
		className = ""
		%>
		</g:if><g:else>
		<%
		picName = "img_swap_on.png"
		popUpUrl = ""
		onClickVar = ""
		className = "inline"
		%></g:else>
		
		
		
    <a href="#inline_content${popUpUrl}${i}" class="${className}" onmouseover="${onClickVar}(${i})" > <img src="../images/${picName}" /></a>
	


	
	
	<div style='display:none'>
		<div id="inline_content${i}" style='padding:10px; background:#fff;'>
		Make a Contribution
		<br><br>
		
		<form name ="makeCont" action = "save" method = "POST">
		<table>
		<tr>
		<td>Name   : <input type = "text" name = "name" value =""></td></tr>
		<tr><td>Email   : <input type = "text" name = "email" value =""></td></tr><br>
		<tr><td>Contribution          : <input type = "text" name = "cont" value =""></td></tr>
		<tr><td>Contribution Type     : <input type = "text" name = "contType" value =""></td></tr>
		<tr><td><input type = "text" name = "picId" value ="${i}" hidden = "true"></td></tr>
		<tr><td>City   :<input type = "text" name = "city" value ="" ></td></tr>
		<tr><td>Age   : <input type = "text" name = "age" value =""></td></tr>
		<tr><td><input type = "submit" ></td></tr>
		</tr>
		</table>
		</form>
	
		</div>
	</div>
	
	
	
	<%-- When the user clicks the picture that has already been used to submit a contribution  --%>
	
	
	
	<div style='display:none'>
	
		<div id="inline_contenty${i}" style='padding:10px; background:#fff;'>
		
		
		
		
		
		
		<table>
		<tr>
		<td>Name   : <input type = "text" name = "name1" id ="name1" value ="" ></td></tr>
		<tr><td>Email   : <input type = "text" name = "email1" value ="praveen"></td></tr><br>
		<tr><td>Contribution   : <input type = "text" name = "cont1" value =""></td></tr>
		<tr><td>Contribution Type   : <input type = "text" name = "contType1" value =""></td></tr>
		
		
		</tr>
		</table>
		
		
		
		
		
		</div>
		
	</div>
	
	
	
	
	<%i++%>
    
</g:while>
	</div>
</div>

<div id="background"><img src="../images/background.jpg" /></div>
	
	
</body> 
</html>