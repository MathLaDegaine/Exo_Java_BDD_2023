<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les chaînes</title>
</head>
<body bgcolor=white>
    <h1>Exercices sur les chaînes de caractères</h1>
    <form action="#" method="post">
        <p>Saisir une chaîne (au moins 6 caractères) : <input type="text" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération de la chaîne saisie --%>
    <% String chaine = request.getParameter("chaine"); %>

    <% if (chaine != null && chaine.length() >= 6) { %>

        <%-- Longueur de la chaîne --%>
        <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères.</p>

        <%-- Extraction du 3e caractère --%>
        <p>Le 3e caractère de votre chaîne est : <%= chaine.charAt(2) %></p>

        <%-- Extraction d'une sous-chaîne (de l'index 2 à 6) --%>
        <p>Une sous-chaîne de votre texte : <%= chaine.substring(2, 6) %></p>

        <%-- Recherche de la première occurrence de 'e' --%>
        <% int position = chaine.indexOf('e'); %>
        <% if (position != -1) { %>
            <p>Le premier 'e' est à la position : <%= position %></p>
        <% } else { %>
            <p>Il n'y a pas de 'e' dans votre texte.</p>
        <% } %>

        <%-- Exercice 1 : Compter le nombre de 'e' --%>
        <h2>Exercice 1 : Nombre de 'e'</h2>
        <% 
            int compteurE = 0;
            for (int i = 0; i < chaine.length(); i++) {
                if (chaine.charAt(i) == 'e') {
                    compteurE++;
                }
            }
        %>
        <p>Le nombre de 'e' dans votre texte est : <%= compteurE %></p>

        <%-- Exercice 2 : Affichage vertical --%>
        <h2>Exercice 2 : Affichage vertical</h2>
        <p>
            <% for (int i = 0; i < chaine.length(); i++) { %>
                <%= chaine.charAt(i) %> <br>
            <% } %>
        </p>

        <%-- Exercice 3 : Retour à la ligne à chaque espace --%>
        <h2>Exercice 3 : Retour à la ligne</h2>
        <p>
            <%= chaine.replace(" ", "<br>") %>
        </p>

        <%-- Exercice 4 : Afficher une lettre sur deux --%>
        <h2>Exercice 4 : Affichage d'une lettre sur deux</h2>
        <p>
            <% for (int i = 0; i < chaine.length(); i += 2) { %>
                <%= chaine.charAt(i) %>
            <% } %>
        </p>

        <%-- Exercice 5 : Affichage en verlant --%>
        <h2>Exercice 5 : Phrase en verlant</h2>
        <p>
            <% for (int i = chaine.length() - 1; i >= 0; i--) { %>
                <%= chaine.charAt(i) %>
            <% } %>
        </p>

        <%-- Exercice 6 : Comptage des consonnes et voyelles --%>
        <h2>Exercice 6 : Consonnes et voyelles</h2>
        <%
            int voyelles = 0, consonnes = 0;
            String voyellesListe = "aeiouyAEIOUY";
            String lettres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

            for (int i = 0; i < chaine.length(); i++) {
                char c = chaine.charAt(i);
                if (lettres.indexOf(c) != -1) { // Vérifie si c'est une lettre
                    if (voyellesListe.indexOf(c) != -1) {
                        voyelles++;
                    } else {
                        consonnes++;
                    }
                }
            }
        %>
        <p>Nombre de voyelles : <%= voyelles %></p>
        <p>Nombre de consonnes : <%= consonnes %></p>

    <% } else if (chaine != null) { %>
        <p>Veuillez entrer une chaîne d'au moins 6 caractères.</p>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
