 <%@include file="shared/header.jsp" %>
  
   <div class="account-in">
   	 <div class="container">
   	 <%@ page isELIgnored="false" %>
<div class="container">
   	  <div class="w3-container">
        <div class="form" >
            <h2>Login with Username and Password</h2>

            <c:if test="${not empty logout}">
                <div class="error" style="color: #ff0000;">${logout}</div>
            </c:if>
            <form name="loginForm" action="<c:url value="/j_spring_security_check" />" method="post">
                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>
               
                    <label for="username">User: </label>
                    <input type="text" id="username" name="j_username" style="width:30%" class="w3-input w3-border w3-animate-input" />
               
                
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="j_password" style="width:30%" class="w3-input w3-border w3-animate-input" />
             <br>
                <input type="submit" value="Submit" class="btn btn-default">
            </form>
        </div>
    </div>
</div>

		</div>
		<div class="col-md-5 left-account ">
			<a href="single.html"><img class="img-responsive " src="${images}/s4.jpg" alt=""/></a>
			<div class="five-in">
			<h1>35% </h1><span>discount</span>
			</div>
			<a href="register" class="create">Create an account</a>
			<div class="clearfix"> </div>
		</div>
	    <div class="clearfix"> </div>
	  </div>
   
   <div class="map">
	   <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
   </div>
   <%@include file="shared/footer.jsp" %>