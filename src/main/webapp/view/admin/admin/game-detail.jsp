<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Game Details</title>
    <!-- Include your CSS files here -->
</head>
<body>
    <div class="card height-auto">
        <div class="card-body">
            <div class="heading-layout1">
                <div class="item-title">
                    <h3>Game Moves - Game ID: ${gameId}</h3>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table display data-table text-nowrap">
                    <thead>
                        <tr>
                            <th>Move Number</th>
                            <th>Player Color</th>
                            <th>Move Notation</th>
                            <th>Is Checkmate</th>
                            <th>Board State</th>
                            <th>Created At</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="move" items="${moves}">
                            <tr>
                                <td>${move.move_number}</td>
                                <td>${move.player_color}</td>
                                <td>${move.move_notation}</td>
                                <td>${move.is_checkmate ? 'Yes' : 'No'}</td>
                                <td>${move.board_state_fen}</td>
                                <td>${move.created_at}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
