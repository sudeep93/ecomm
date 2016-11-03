<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/shared/header.jsp" %>

<%@ page isELIgnored="false" %>
<div class="container">
    <div class="w3-container">
        <div class="form">
            <h1>Cutomer</h1>


            <p class="lead">Customer Details:</p>
       

        <form:form commandName="order" class="form-horizontal">

        <h3>Shipping Address:</h3>

       
            <label for="shippingStreet">Street Name</label>
            <form:input path="cart.customer.shippingAddress.streetName" id="shippingStreet" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

       
            <label for="shippingApartmentNumber">Apartment Number</label>
            <form:input path="cart.customer.shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

       
            <label for="shippingCity">City</label>
            <form:input path="cart.customer.shippingAddress.city" id="shippingCity" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

       
            <label for="shippingState">State</label>
            <form:input path="cart.customer.shippingAddress.state" id="shippingState" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

       
            <label for="shippingCountry">Country</label>
            <form:input path="cart.customer.shippingAddress.country" id="shippingCountry" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

       
            <label for="shippingZip">Zipcode</label>
            <form:input path="cart.customer.shippingAddress.zipcode" id="shippingZip" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        <input type="hidden" name="_flowExecutionKey" />

        <br/><br/>

        <button class="btn btn-default" name="_eventId_backToCollectCustomerInfo" style="color: black;background:#F9D9BE;border: 1px solid #555;">Back</button>

        <input type="submit" value="Next" class="btn btn-default" name="_eventId_shippingDetailCollected" style="color: black;background:#F9D9BE;border: 1px solid #555;"/>

        <button class="btn btn-default" name="_eventId_cancel" style="color: black;background:#F9D9BE;border: 1px solid #555;">Cancel</button>

        </form:form>
        </div>
        </div>
        </div>
        

<%@ include file="/WEB-INF/views/shared/footer.jsp" %>