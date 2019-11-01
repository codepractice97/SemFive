<jsp:declaration>
int num1,num2;
String op;
</jsp:declaration>
<jsp:scriptlet>
num1=Integer.parseInt(request.getParameter("num1"));
num2=Integer.parseInt(request.getParameter("num2"));
op = request.getParameter("calc");
</jsp:scriptlet>
<%=num1%> <%=op%> <%=num2%> =

<% if(op.equals("+")) { %>
	<%=num1+num2%>
<% } else if(op.equals("-")) { %>
	<%=num1-num2%>
<% } else if(op.equals("*")) { %>
	<%=num1*num2%>
<% } %>
