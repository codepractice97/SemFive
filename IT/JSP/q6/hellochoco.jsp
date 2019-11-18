<%@ taglib prefix="ex" uri="https://journaldev.com/jsp/tlds/mytags" %>
<html>
<head>
	<title>Hello Choco</title>
</head>
<body>
	<ex:hello name="${param.name}"/>
	<ex:choco texture="${param.texture}"/>
</body>
</html>
