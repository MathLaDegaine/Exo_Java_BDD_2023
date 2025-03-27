<%@ page import="com.example.Task" %> <!-- Importation de la classe Task -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Task Details</title>
</head>
<body>
    <h2>Task Details</h2>

    <%
        // Création d'une instance de Task avec des valeurs d'exemple
        Task task = new Task("Finish project", "Complete the Java project by tomorrow", new java.util.Date());
    %>

    <p><strong>Title:</strong> <%= task.getTitle() %></p>
    <p><strong>Description:</strong> <%= task.getDescription() %></p>
    <p><strong>Due Date:</strong> <%= task.getDueDate() %></p>
    <p><strong>Completed:</strong> <%= task.isCompleted() ? "Yes" : "No" %></p>

</body>
</html>
