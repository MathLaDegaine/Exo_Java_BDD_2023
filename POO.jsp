<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor="white">
    <h2>Ajouter une Tâche</h2>
    <form action="TaskServlet" method="post">
        <label>Titre :</label>
        <input type="text" name="title" required><br>
        <label>Description :</label>
        <input type="text" name="description" required><br>
        <label>Date de fin :</label>
        <input type="date" name="dueDate" required><br>
        <button type="submit">Ajouter</button>
    </form>
    <h2>Liste des Taches</h2>
<ul>
    <% for (Task task : tasks) { %>
    <li>
        <strong><%= task.getTitle() %></strong> - <%= task.getDescription() %> - 
                <%= task.getDueDate() %> - 
                <%= task.isCompleted() ? "Terminée" : "En cours" %>
                <form action="TaskServlet" method="post" style="display:inline;">
                    <input type="hidden" name="title" value="<%= task.getTitle() %>">
                    <button type="submit" name="action" value="delete">Supprimer</button>
                    <button type="submit" name="action" value="complete">Terminer</button>
                </form>
    </li>
</ul>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
