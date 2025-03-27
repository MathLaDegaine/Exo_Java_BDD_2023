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
    <li></li>
</ul>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
