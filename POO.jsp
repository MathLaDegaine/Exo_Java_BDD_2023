<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Date, java.text.SimpleDateFormat, com.example.Task" %>

<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestionnaire de Tâches</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: #333; }
        form { margin-bottom: 20px; }
        input, button { margin: 5px; padding: 8px; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 10px 0; }
    </style>
</head>
<body>
    <h2>Ajouter une Tâche</h2>
    <form action="TaskServlet" method="post">
        <label for="title">Titre :</label>
        <input type="text" id="title" name="title" required><br>
        <label for="description">Description :</label>
        <input type="text" id="description" name="description" required><br>
        <label for="dueDate">Date de fin :</label>
        <input type="date" id="dueDate" name="dueDate" required><br>
        <button type="submit">Ajouter</button>
    </form>
    
    <h2>Liste des Tâches</h2>
    <ul>
        <% for (Task task : tasks) { %>
        <li>
            <strong><%= task.getTitle() %></strong> - <%= task.getDescription() %> - 
            <%= new SimpleDateFormat("yyyy-MM-dd").format(task.getDueDate()) %> - 
            <%= task.isCompleted() ? "Terminée" : "En cours" %>
            <form action="TaskServlet" method="post" style="display:inline;">
                <input type="hidden" name="title" value="<%= task.getTitle() %>">
                <button type="submit" name="action" value="delete">Supprimer</button>
                <button type="submit" name="action" value="complete">Terminer</button>
            </form>
        </li>
        <% } %>
    </ul>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
