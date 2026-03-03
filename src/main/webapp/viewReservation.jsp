<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.oceanview.reservation_system.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Reservations - Ocean View Resort</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #0077b6; color: white; }
        tr:nth-child(even) { background-color: #f1f1f1; }
        h2 { text-align: center; color: #0077b6; }
        a.button { background-color: #00b4d8; color: white; padding: 5px 10px; text-decoration: none; border-radius: 5px; }
        a.button:hover { background-color: #0096c7; }
        
        .btn-bill,
.btn-delete {
    padding: 6px 12px;
    text-decoration: none;
    border-radius: 6px;
    color: white;
    margin-right: 8px;
}

.btn-bill {
    background-color: #17a2b8;
}

.btn-delete {
    background-color: #dc3545;
}
    </style>
</head>
<body>
<%
    String message = request.getParameter("msg");
    if ("deleted".equals(message)) {
%>
    <div style="
        width: 50%;
        margin: 20px auto;
        padding: 10px;
        background-color: #d4edda;
        color: #155724;
        border-radius: 6px;
        text-align: center;
        font-weight: bold;">
        Reservation deleted successfully!
    </div>
<%
    }
%>

    <h2>All Reservations</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Guest Name</th>
            <th>Room Type</th>
            <th>Check-in</th>
            <th>Check-out</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Connection conn = DBConnection.getConnection();
                String sql = "SELECT id, guest_name, room_type, checkin_date, checkout_date FROM reservations";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("guest_name");
                    String room = rs.getString("room_type");
                    Date checkin = rs.getDate("checkin_date");
                    Date checkout = rs.getDate("checkout_date");
        %>
        <tr>
    <td><%= id %></td>
    <td><%= name %></td>
    <td><%= room %></td>
    <td><%= checkin %></td>
    <td><%= checkout %></td>

    <td>
        <a class="btn-bill"
   href="BillServlet?reservationId=<%= id %>">
   Bill
   </a>
        <a class="btn-delete"
           href="deleteReservation?id=<%= id %>"
           onclick="return confirm('Are you sure you want to delete this reservation?');">
           Delete
        </a>
    </td>
</tr>
        <%
                }
                rs.close();
                ps.close();
                conn.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
