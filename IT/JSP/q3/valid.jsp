<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="POST">
<label>Name:</label>
<input type="text" name="user_name" /><br><br>
<label>Birth Date:</label>
<input type="text" name="birth_date" /><br><br>
<label>Email:</label>
<input type="text" name="email" /><br><br>
<label>Gender:</label>
<input type="radio" name="gender" value="male" /> Male
<input type="radio" name="gender" value="female" /> Female<br><br>
<label>Lucky Number:</label>
<input type="text" name="l_num" /><br><br>
<label>Favorite Foods:</label>
<input type="checkbox" name="food" value="pizza" checked>Pizza
<input type="checkbox" name="food" value="pasta">Pasta<br><br>
<input type="submit" name="submit" />
</form>

<c:if test="${!empty param.submit}" >
	<c:if test="${empty param.user_name}" >
    <c:out value="Please enter a valid User Name" /><br>
	</c:if>
	<c:if test="${empty param.birth_date}" >
    <c:out value="Please enter a valid birth date" /><br>
	</c:if>
	<c:if test="${empty param.email}" >
    <c:out value="Please enter a valid email" /><br>
	</c:if>
	<c:if test="${empty param.gender}" >
   	<c:out value="Please select a gender" /><br>
	</c:if>
	<c:if test="${empty param.l_num}" >
    <c:out value="Please enter a valid lucky number" /><br>
	</c:if>
	<c:if test="${empty param.food}" >
    <c:out value="Please select a favorite food" /><br>
	</c:if>
</c:if>
