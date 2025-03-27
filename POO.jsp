<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestionnaire de Tâches</title>
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
    
    <h2>Liste des Tâches</h2>
    
    <ul>
        
        <li>
            
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
