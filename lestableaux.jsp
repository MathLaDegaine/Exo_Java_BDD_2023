<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor=white>
    <h1>Exercices sur les tableaux</h1>
    <form action="#" method="post">
        <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>

    <% if (chaine != null && !chaine.trim().isEmpty()) { 
        String[] tableauDeChiffres = chaine.trim().split("\\s+"); 

        if (tableauDeChiffres.length >= 3) { 
            int[] valeurs = new int[tableauDeChiffres.length];
            for (int i = 0; i < tableauDeChiffres.length; i++) {
                valeurs[i] = Integer.parseInt(tableauDeChiffres[i]);
            }
    %>

        <p>Le tableau contient <%= valeurs.length %> valeurs</p>
        <p>Chiffre 1 : <%= valeurs[0] %></p>
        <p>Chiffre 2 : <%= valeurs[1] %></p>
        <p>Chiffre 3 : <%= valeurs[2] %></p>

        <%-- Exercice 1 : Carré de la première valeur --%>
        <h2>Exercice 1 : Le carré de la première valeur</h2>
        <p>Résultat : <%= valeurs[0] * valeurs[0] %></p>

        <%-- Exercice 2 : Somme des deux premières valeurs --%>
        <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
        <p>Résultat : <%= valeurs[0] + valeurs[1] %></p>

        <%-- Exercice 3 : Somme de toutes les valeurs --%>
        <h2>Exercice 3 : La somme de toutes les valeurs</h2>
        <%
            int somme = 0;
            for (int valeur : valeurs) {
                somme += valeur;
            }
        %>
        <p>Résultat : <%= somme %></p>

        <%-- Exercice 4 : Valeur maximale --%>
        <h2>Exercice 4 : La valeur maximale</h2>
        <%
            int max = valeurs[0];
            for (int valeur : valeurs) {
                if (valeur > max) {
                    max = valeur;
                }
            }
        %>
        <p>Résultat : <%= max %></p>

        <%-- Exercice 5 : Valeur minimale --%>
        <h2>Exercice 5 : La valeur minimale</h2>
        <%
            int min = valeurs[0];
            for (int valeur : valeurs) {
                if (valeur < min) {
                    min = valeur;
                }
            }
        %>
        <p>Résultat : <%= min %></p>

        <%-- Exercice 6 : Valeur la plus proche de 0 --%>
        <h2>Exercice 6 : La valeur la plus proche de 0</h2>
        <%
            int procheDeZero = valeurs[0];
            for (int valeur : valeurs) {
                if (Math.abs(valeur) < Math.abs(procheDeZero)) {
                    procheDeZero = valeur;
                }
            }
        %>
        <p>Résultat : <%= procheDeZero %></p>

        <%-- Exercice 7 : Valeur la plus proche de 0 (avec préférence pour le positif) --%>
        <h2>Exercice 7 : La valeur la plus proche de 0 (préférence pour le positif)</h2>
        <%
            int procheDeZero2 = valeurs[0];
            for (int valeur : valeurs) {
                if (Math.abs(valeur) < Math.abs(procheDeZero2) || 
                    (Math.abs(valeur) == Math.abs(procheDeZero2) && valeur > 0)) {
                    procheDeZero2 = valeur;
                }
            }
        %>
        <p>Résultat : <%= procheDeZero2 %></p>

    <% 
        } else { 
    %>
        <p>Veuillez entrer au moins 3 nombres séparés par des espaces.</p>
    <% 
        } 
    } 
    %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
