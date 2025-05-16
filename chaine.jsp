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
    String Plettre = bonjour.toUpperCase(1);
   
%>
  <h1>Résultats de traitement de la chaîne</h1>
    <p><strong>Original :</strong> <%= bonjour %></p>
    <p><strong>Tout en MAJUSCULES :</strong> <%= majuscules %></p>
    <p><strong>Seulement la 1ère lettre en majuscule :</strong> <%= Plettre %></p>

</body>
</html>

