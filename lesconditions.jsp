<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor=white>
    <h1>Exercices sur les conditions</h1>
    <form action="#" method="post">
        <p>Saisir la valeur A : <input type="text" name="valeurA"></p>
        <p>Saisir la valeur B : <input type="text" name="valeurB"></p>
        <p>Saisir la valeur C : <input type="text" name="valeurC"></p>
        <p>Saisir un nombre pour vérifier s'il est pair ou impair : <input type="text" name="valeurPair"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <% 
        // Récupération des valeurs
        String valeurA = request.getParameter("valeurA");
        String valeurB = request.getParameter("valeurB");
        String valeurC = request.getParameter("valeurC");
        String valeurPair = request.getParameter("valeurPair");

        // Vérification et exécution de l'exercice 1
        if (valeurA != null && valeurB != null && valeurC != null 
            && !valeurA.isEmpty() && !valeurB.isEmpty() && !valeurC.isEmpty()) {
            
            int A = Integer.parseInt(valeurA);
            int B = Integer.parseInt(valeurB);
            int C = Integer.parseInt(valeurC);
    %>

    <h2>Exercice 1 : Comparaison 1</h2>
    <% if ((C >= A && C <= B) || (C >= B && C <= A)) { %>
        <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <% } %>

    <% } %> <!-- Fin Exercice 1 -->

    <% 
        // Vérification et exécution de l'exercice 2
        if (valeurPair != null && !valeurPair.isEmpty()) {
            int nombre = Integer.parseInt(valeurPair);
    %>

    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <% if (nombre % 2 == 0) { %>
        <p>Le nombre <%= nombre %> est pair.</p>
    <% } else { %>
        <p>Le nombre <%= nombre %> est impair.</p>
    <% } %>

    <% } %> <!-- Fin Exercice 2 -->

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
