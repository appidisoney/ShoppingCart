<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>payment</title>
<link href="<c:url value="/resources/css/credit.css" />" rel="stylesheet">
</head>
<body>
body  style="padding-top:">
<div id="card">
<section class="credit-card visa gr-visa">
        <div></div>
        <form action="pay" method="post">
            <h2>Payment Details</h2>

            <ul class="inputs">
                <li>
                    <label>Card Number</label>
                    <input type="text" name="card_number" pattern="[0-9]{13,16}"placeholder="xxxx xxxx xxxx xxxx" class="full gr-input" required />
                </li>
                <li class="expire last">
                    <label>Expiration</label>
                    <input type="text" name="expire_month" placeholder="December (date)" size="10" class="month gr-input" required />
                    <input type="text" name="expire_year" placeholder="year" size="10" class="year gr-input" required />
                    <div class="clearfix"></div>
                </li>
                <li class="cvc-code last">
                    <label>CVC Code</label>
                    <input type="text" name="cvc_code" placeholder="xxx" size="3" class="gr-input" required />
                </li>
                <li><button type="submit" class="btn btn-xs btn-primary">Pay</button></li>
         
            </ul>
        </form>
    </section>
    </div>


</body>
</html>
