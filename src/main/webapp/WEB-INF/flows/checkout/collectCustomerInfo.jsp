
<%@ include file="/WEB-INF/views/shared/header.jsp" %>


<div class="container">
    <div class="w3-container">
        <div class="form">
            <h1>Cutomer</h1>


            <p class="lead">Customer Details:</p>
        

        <form:form commandName="order" class="form-horizontal">

        <h3>Basic Info:</h3>

            <label for="name">Name</label>
            <form:input path="cart.customer.customerName" id="name" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

            <label for="email">Email</label>
            <form:input path="cart.customer.customerEmail" id="email" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

       
            <label for="phone">Phone</label>
            <form:input path="cart.customer.customerPhone" id="phone" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        <br/>


        
            <label for="billingStreet">Street Name</label>
            <form:input path="cart.customer.billingAddress.streetName" id="billingStreet" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        
            <label for="billingApartmentNumber">Apartment Number</label>
            <form:input path="cart.customer.billingAddress.apartmentNumber" id="billingApartmentNumber" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        
            <label for="billingCity">City</label>
            <form:input path="cart.customer.billingAddress.city" id="billingCity" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        
            <label for="billingState">State</label>
            <form:input path="cart.customer.billingAddress.state" id="billingState" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        
            <label for="billingCountry">Country</label>
            <form:input path="cart.customer.billingAddress.country" id="billingCountry" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        
            <label for="billingZip">Zipcode</label>
            <form:input path="cart.customer.billingAddress.zipcode" id="billingZip" class="w3-input w3-border w3-animate-input" style="width:30%" />
        

        <input type="hidden" name="_flowExecutionKey" />

        <br/><br/>
        <!--  on attribute - assign event id -->
        <!--  to attribute id value in state -->

        <input type="submit" value="Next" class="btn btn-default" name="_eventId_customerInfoCollected" style="color: black;background:#F9D9BE;border: 1px solid #555;"/>

        <button class="btn btn-default" name="_eventId_cancel" style="color: black;background:#F9D9BE;border: 1px solid #555;">Cancel</button>

        </form:form>
        </div>
        </div>
        </div>
       

<%@ include file="/WEB-INF/views/shared/footer.jsp" %>