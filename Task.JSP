<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionnaire de Taches</title>
</head>
<body>
    <h2>Gestionnaire de Taches</h2>

    <form action="task.jsp" method="post">
        <h3>Ajouter une Tache</h3>
        <label for="title">Titre : </label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="description">Description : </label>
        <input type="text" id="description" name="description" required><br><br>
        
        <label for="dueDate">Date d'echeance: </label>
        <input type="text" id="dueDate" name="dueDate" required><br><br>
        
        <input type="submit" value="Ajouter">
    </form>

    <hr>

    <h3>Taches en cours</h3>

    <%
        List<Task> tasks = (List<Task>) session.getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<Task>();
            session.setAttribute("tasks", tasks);
        }

        if (request.getMethod().equalsIgnoreCase("POST")) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dueDateString = request.getParameter("dueDate");
            
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dueDate = sdf.parse(dueDateString);
                Task newTask = new Task(title, description, dueDate);
                tasks.add(newTask);
                session.setAttribute("tasks", tasks);
            } catch (Exception e) {
                out.println("Erreur dans le format de la date.");
            }
        }
    %>

    <table border="1">
        <tr>
            <th>#</th>
            <th>Titre</th>
            <th>Description</th>
            <th>Date d'echeance</th>
            <th>Complete</th>
            <th>Actions</th>
        </tr>
        
        <%
            for (int i = 0; i < tasks.size(); i++) {
                Task task = tasks.get(i);
        %>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= task.getTitle() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= new SimpleDateFormat("yyyy-MM-dd").format(task.getDueDate()) %></td>
            <td><%= task.isCompleted() ? "Oui" : "Non" %></td>
            <td>
                <form action="task.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="complete">
                    <input type="hidden" name="taskIndex" value="<%= i %>">
                    <input type="submit" value="Completer">
                </form>
                <form action="task.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="taskIndex" value="<%= i %>">
                    <input type="submit" value="Supprimer">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <%
        String action = request.getParameter("action");
        if ("complete".equals(action)) {
            int taskIndex = Integer.parseInt(request.getParameter("taskIndex"));
            Task task = tasks.get(taskIndex);
            task.setCompleted(true);
            session.setAttribute("tasks", tasks);
        } else if ("delete".equals(action)) {
            int taskIndex = Integer.parseInt(request.getParameter("taskIndex"));
            tasks.remove(taskIndex);
            session.setAttribute("tasks", tasks);
        }
    %>
</body>
</html>
