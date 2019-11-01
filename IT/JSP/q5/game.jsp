<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post">
<label>Word:</label>
<input type="text" name="word">
<input type="radio" name="op" value="odd">ODD
<input type="radio" name="op" value="even">EVEN
<input type="submit" name="submit">
</form>

<%!
Boolean isVowel(char c){
	if ( c=='a' || c=='e' || c=='i' || c=='o' || c=='u' )
		return true;
	return false;
}
%>

<%
if (request.getParameter("op") != null){
	int flag = 1;
	String op = request.getParameter("op");
	String word = request.getParameter("word");
	int len = word.length();
	int start = op.equals("odd") ? 0 : 1;
	for (int i = start; i < len; i+=2){
		if (!isVowel(word.charAt(i))){
			flag = 0;
			out.println("You Lose");
			break;
		}
	}
	if (flag == 1)
		out.println("You Won");
}
%>
