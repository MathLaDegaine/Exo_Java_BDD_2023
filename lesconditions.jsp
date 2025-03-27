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
        boolean terminee;

        public MyClass(String name, boolean terminee) {
            this.nameTache = name;
            this.terminee = terminee;
        }

        public String getStatus() {
            return terminee ? "Terminee" : "Non terminee";
        }

        public void setStatus(boolean status) {
            this.terminee = status;
        }
    }

    MyClass[] taches = new MyClass[10];
    int currentIndex = 0;
%>

<%
    String valeur = request.getParameter("valeur");
    String termineeParam = request.getParameter("terminee");
    String taskIndexParam = request.getParameter("taskIndex");

    boolean terminee = termineeParam != null && termineeParam.equals("true");

    if (valeur != null && !valeur.isEmpty() && currentIndex < taches.length) {
        taches[currentIndex] = new MyClass(valeur, false); // Tache par défaut non terminee
        currentIndex++;
    }

    if (taskIndexParam != null) {
        int taskIndex = Integer.parseInt(taskIndexParam);
        if (taskIndex >= 0 && taskIndex < currentIndex) {
            taches[taskIndex].setStatus(terminee); // Mettre à jour le statut de la tâche
        }
    }
%>

<h2>Liste des Taches Saisies :</h2>
<ul>
<%
    for (int i = 0; i < currentIndex; i++) {
%>
    <li>
        <%= taches[i].nameTache %> - <%= taches[i].getStatus() %>
        <form action="#" method="post" style="display:inline;">
            <input type="hidden" name="taskIndex" value="<%= i %>">
            <input type="checkbox" name="terminee" value="true" 
                <%= taches[i].terminee ? "checked" : "" %> 
                onchange="this.form.submit()"> 
            Terminee
        </form>
    </li>
<%
    }
%>
</ul>

</body>
</html>
