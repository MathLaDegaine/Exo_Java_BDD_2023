<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les boucles</h1>

<form action="POO.jsp" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% 
    String valeur = request.getParameter("valeur"); 
    if (valeur != null && !valeur.isEmpty()) {
        int cpt = Integer.parseInt(valeur);
%>



<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
