<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="myform">
<label>Enter a number (n):</label>
<input type="number" name="num" />
<button>Submit</button>
</form>
<c:forEach var="i" begin="1" end="${param.num}" >
	<c:forEach var="j" begin="1" end="${i}" >
	<c:out value="${j}" />
	</c:forEach>
	<br/>
</c:forEach>
