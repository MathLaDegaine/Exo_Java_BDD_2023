<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>Taches</title>
</head>
<body bgcolor=white>
<h1>Saisir une tache</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nom d'une tache : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Enregistrer">
</form>

<%! 
    class MyClass {
        String nameTache;

        public MyClass(String name) {
            nameTache = name;
        }
    }

    MyClass[] taches = new MyClass[10];
    int currentIndex = 0;
%>

<%
    String valeur = request.getParameter("valeur");

    if (valeur != null && !valeur.isEmpty() && currentIndex < taches.length) {
        taches[currentIndex] = new MyClass(valeur);
        currentIndex++;
    }
%>

<h2>Liste des Taches Saisies :</h2>
<ul>
<%
    for (int i = 0; i < currentIndex; i++) {
%>
    <li><%= taches[i].nameTache %></li>
<%
    }
%>
</ul>

</body>
</html>
