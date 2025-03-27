<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

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

        public void setStatus(boolean status) {
            this.terminee = status;
        }
    }
%>

<%
    // Récupérer la liste des tâches stockées dans la session, si elle existe
    java.util.List<MyClass> taches = (java.util.List<MyClass>) session.getAttribute("taches");
    
    if (taches == null) {
        taches = new java.util.ArrayList<MyClass>();  // Initialiser la liste si elle n'existe pas
    }

    // Ajouter une nouvelle tâche si un nom de tâche est soumis
    String valeur = request.getParameter("valeur");
    if (valeur != null && !valeur.isEmpty()) {
        taches.add(new MyClass(valeur, false)); // Par défaut, la tâche est non terminée
    }

    // Mettre à jour le statut de la tâche si l'index est spécifié
    String termineeParam = request.getParameter("terminee");
    String taskIndexParam = request.getParameter("taskIndex");

    if (taskIndexParam != null) {
        int taskIndex = Integer.parseInt(taskIndexParam);
        if (taskIndex >= 0 && taskIndex < taches.size()) {
            boolean terminee = termineeParam != null && termineeParam.equals("true");
            taches.get(taskIndex).setStatus(terminee);
        }
    }

    // Sauvegarder la liste de tâches mise à jour dans la session
    session.setAttribute("taches", taches);
%>

<h2>Liste des Taches Saisies :</h2>
<ul>
<%
    // Afficher toutes les tâches avec leur statut
    for (int i = 0; i < taches.size(); i++) {
        MyClass task = taches.get(i);
%>
    <li>
        <%= task.nameTache %>
        <form action="#" method="post" style="display:inline;">
            <input type="hidden" name="taskIndex" value="<%= i %>">
            <input type="checkbox" name="terminee" value="true" 
                <%= task.terminee ? "checked" : "" %> 
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
