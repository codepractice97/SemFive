<form id="myform">
<label>Enter a number (n):</label>
<input type="number" name="num" />
<button>Submit</button>
</form>
<%
String res = request.getParameter("num");
if (res!=null){
	int n = Integer.parseInt(res);
	for (int i = 1; i <= n; i++){
		for (int j = 1; j <= i; j++)
			out.print(j + " ");
		out.print("<br>");
	}
}
%>
