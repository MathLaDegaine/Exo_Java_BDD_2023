<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chaîne JSP</title>
</head>
<body>
<%
    String bonjour = "salut la compagnie";
    String majuscules = bonjour.toUpperCase();

   
%>

<h2>Message original : <%= bonjour %></h2>
<h2>En majuscules : <%= majuscules %></h2>
<h2>Première lettre en majuscule : <%= premiereLettreMajuscule %></h2>

</body>
</html>

