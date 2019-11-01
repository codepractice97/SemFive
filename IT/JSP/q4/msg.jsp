<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<form method="POST">
<label>Name:</label>
<input type="text" name="name" />
<input type="submit" name="submit" />
</form>

<%
String name = request.getParameter("name");
if (name != null){
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	String date = sdf.format(new Date());
	int hour = Integer.parseInt(date.substring(0,2));
	if (hour < 12)
		out.print("Good Morning " + name);
	else if (hour >= 12 && hour < 17 )
		out.print("Good Afternoon " + name);
	else if (hour >= 17)
		out.print("Good Evening " + name);
}
%>
