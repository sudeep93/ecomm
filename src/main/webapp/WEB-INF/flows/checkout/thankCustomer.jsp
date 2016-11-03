<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/shared/header.jsp" %>
<%@ page isELIgnored="false" %>
<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Thank you!</h1>

                    <p>Your order will be shipped in 7-8 business days!</p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="${allproducts}" class="btn btn-default">OK</a></p>
        </section>

<%@ include file="/WEB-INF/views/shared/footer.jsp" %>