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
    <label for="terminee">Tache terminee : </label>
    <input type="checkbox" id="terminee" name="terminee" value="true">
    <input type="submit" value="Enregistrer">
</form>

<%! 
    class MyClass {
        String nameTache;
        boolean terminee;

        public MyClass(String name, boolean terminee) {
            this.nameTache = name;
            this.terminee = terminee;
        }

        public String getStatus() {
            return terminee ? "Terminee" : "Non terminee";
        }
    }

    MyClass[] taches = new MyClass[10];
    int currentIndex = 0;
%>

<%
    String valeur = request.getParameter("valeur");
    String termineeParam = request.getParameter("terminee");
    boolean terminee = termineeParam != null && termineeParam.equals("true");

    if (valeur != null && !valeur.isEmpty() && currentIndex < taches.length) {
        taches[currentIndex] = new MyClass(valeur, terminee);
        currentIndex++;
    }
%>

<h2>Liste des Taches Saisies :</h2>
<ul>
<%
    for (int i = 0; i < currentIndex; i++) {
%>
    <li><%= taches[i].nameTache %> - <%= taches[i].getStatus() %></li>
<%
    }
%>
</ul>

</body>
</html>
