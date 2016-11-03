<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/shared/header.jsp" %>



 <h1 >Register Customer</h1>

            <p class="lead">Please fill in your information below:</p>
<div class="container">
   	  <div class="w3-container">
        <div class="form" >
           
        
        <c:url value="/customer/registration" var="url"></c:url>
        <form:form action="${url }"
                   method="post" commandName="customer">

        <h2>Basic Info:</h2>
 	
 	
        <div class="form">
            <label for="name" >Name</label>
            <form:errors path="customerName" cssStyle="color: red" />
            <form:input path="customerName"  class="w3-input w3-border w3-animate-input" style="width:30%" required="required"/>
            
   
<c:if test="${duplicateEmail!=null }">
        ${duplicateEmail }
        </c:if>

        <form:errors path="customerEmail" cssStyle="color:red" />
            <label for="email">Email</label>
            
          
            <form:input path="customerEmail"  class="w3-input w3-border w3-animate-input" style="width:30%"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required="required"/>
        

           
     
            <label for="phone">Phone</label>
             <form:input path="customerPhone"  class="w3-input w3-border w3-animate-input" style="width:30%" pattern="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$" /> 
        
<c:if test="${duplicateUname!=null }">
       			 ${duplicateUname }
            </c:if>
 	
  

            <label for="username">Username</label>
            <form:errors path="users.username" style="COLOR: #800080 " />
            <form:input path="users.username"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
        
			<label for="password">password</label>
            <form:errors path="users.password" cssStyle="color: #ff0000" />
            <form:input path="users.password" type="password" class="w3-input w3-border w3-animate-input" style="width:30%"  />
        
           
        


        

      <h3>Billing Address:</h3>

        
            <label for="billingStreet">Street Name</label>
            <form:input id="streetName" path="billingAddress.streetName"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        
            <label for="billingApartmentNumber">Apartment Number</label>
            <form:input id="apartmentNumber" path="billingAddress.apartmentNumber"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
        
 
            <label for="billingZip">Zipcode</label>
            <form:input id="zipcode" path="billingAddress.zipcode"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
        
           
            <label for="billingCity">City</label>
            <form:input id="city" path="billingAddress.city"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        
            <label for="billingState">State</label>
            <form:input id="state" path="billingAddress.state" class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        
            <label for="billingCountry">Country</label>
            <form:input id="country" path="billingAddress.country"  class="w3-input w3-border w3-animate-input" style="width:30%"  />

        
           

        <br/>
<button onclick="myFunction(); return false; ">Same adrees as above</button>

<!-- <!--  <input type="checkbox" name="check1" onchange="copyTextValue(this);"/> same shipping address -->

        <h3>Shipping Address:</h3>

        
            <label for="shippingStreet">Street Name</label>
            <form:input id="streetName1" path="shippingAddress.streetName"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        
            <label for="shippingApartmentNumber">Apartment Number</label>
            <form:input id="apartmentNumber1" path="shippingAddress.apartmentNumber" class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        
            <label for="shippingCity">City</label>
            <form:input id="city1"  path="shippingAddress.city" class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        
            <label for="shippingState">State</label>
            <form:input id="state1" path="shippingAddress.state"  class="w3-input w3-border w3-animate-input" style="width:30%"  />
          

        
            <label for="shippingCountry">Country</label>
            <form:input id="country1" path="shippingAddress.country"  class="w3-input w3-border w3-animate-input" style="width:30%"  />


        
            <label for="shippingZip">Zipcode</label>
            <form:input id="zipcode1"  path="shippingAddress.zipcode" class="w3-input w3-border w3-animate-input" style="width:30%"  />
        

        <br><br>
        <input type="submit" value="submit" size="20px" style="color: black;background:#F9D9BE;border: 1px solid #555;">
        <a href="<c:url value="/" />" >Cancel</a>
</div>
        </form:form>
        </div>
        
        </div>
       </div>
       
       
       
       
<script>
$(document).ready(function(){
//when the user clicks off of the zipcode field:
$('#zipcode').keyup(function(){
  if($(this).val().length == 6){
  var zipcode = $(this).val();
  var city = '';
  var state = '';
  var country = '';
  //make a request to the google geocode api
  $.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address='+zipcode)
  .success(function(response){
    //find the city and state
    var address_components = response.results[0].address_components;
    $.each(address_components, function(index, component){
      var types = component.types;
      $.each(types, function(index, type){
        if(type == 'locality') {
          city = component.long_name;
        }
        if(type == 'administrative_area_level_1') {
          state = component.long_name;
        }
        if(type == 'country') {
            country = component.long_name;
          }
      });
    });
    //pre-fill the city and state
    var cities = response.results[0].postcode_localities;
    if(cities) {
      //turn city into a dropdown if necessary
      var $select = $(document.createElement('select'));
      console.log(cities);
      $.each(cities, function(index, locality){
        var $option = $(document.createElement('option'));
        $option.html(locality);
        $option.attr('value',locality);
        if(city == locality) {
          $option.attr('selected','selected');
        }
        $select.append($option);
      });
      $select.attr('id','city');
      $('#city_wrap').html($select);
    } else {
      $('#city').val(city);
     
      $('#country').val(country);
    }
    $('#state').val(state);
    
  });
  }
});
});
</script>
<script>
function myFunction() {
    document.getElementById("streetName1").value = document.getElementById("streetName").value;
    document.getElementById("apartmentNumber1").value = document.getElementById("apartmentNumber").value;
    document.getElementById("zipcode1").value = document.getElementById("zipcode").value;
    document.getElementById("city1").value = document.getElementById("city").value;
    document.getElementById("state1").value = document.getElementById("state").value;
    document.getElementById("country1").value = document.getElementById("country").value;


}
</script>
        
       
   

<%@ include file="/WEB-INF/views/shared/footer.jsp" %>