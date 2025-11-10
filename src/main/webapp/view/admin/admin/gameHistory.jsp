<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Game Replay</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Admin CSS (giữ đồng bộ với list-game.jsp) -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/img/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/fonts/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
    <!-- Chessboard Element (Web Component) -->
    <script type="module">
      import 'https://unpkg.com/chessboard-element?module';
    </script>
    <!-- CSS tuỳ biến cho trang replay: chia layout, danh sách nước đi và bảng chi tiết -->
    <style>
        .replay-controls {
            display: flex;
            gap: 10px;
            align-items: center;
            margin: 16px 0;
        }
        .moves-list {
            max-height: 480px;
            overflow: auto;
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 8px;
            background: #fff;
        }
        .move-item {
            padding: 6px 8px;
            border-bottom: 1px dashed #eee;
            cursor: pointer;
        }
        .move-item.active {
            background-color: #FFF8E6;
            border-left: 3px solid #F77204;
        }
        .board-wrapper {
            display: flex;
            gap: 24px;
            flex-wrap: wrap;
        }
        .board-card {
            flex: 1 1 400px;
        }
        .list-card {
            flex: 1 1 300px;
        }
        .move-details-scroll {
            max-height: 400px;
            overflow-y: auto;
        }
        .move-details-scroll table {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div id="wrapper" class="wrapper bg-ash">
    <!-- Chèn phần header quản trị để đồng bộ giao diện -->
    <jsp:include page="../common/header.jsp"></jsp:include>
    <!-- Bọc toàn bộ nội dung trong layout dashboard -->
    <div class="dashboard-page-one">
        <!-- Sidebar điều hướng dành cho admin -->
        <jsp:include page="../common/sider.jsp"></jsp:include>

        <div class="dashboard-content-one">
            <br/>
            <div class="card height-auto">
                <div class="card-body">
                    <div class="heading-layout1">
                        <div class="item-title">
                            <h3>Replay Game - ID: ${gameId}</h3>
                        </div>
                    </div>

                    <div class="board-wrapper">
                        <!-- Cột bên trái: khối bàn cờ và cụm nút điều khiển -->
                        <div class="board-card">
                            <!-- Các nút điều khiển replay: tua đầu/cuối, lùi/tiến từng bước, play/pause và chỉnh tốc độ -->
                            <div class="replay-controls">
                                <button id="btnFirst" class="btn btn-outline-secondary btn-sm">|&lt;</button>
                                <button id="btnPrev" class="btn btn-outline-secondary btn-sm">&lt;</button>
                                <button id="btnPlayPause" class="btn btn-warning btn-sm">Play</button>
                                <button id="btnNext" class="btn btn-outline-secondary btn-sm">&gt;</button>
                                <button id="btnLast" class="btn btn-outline-secondary btn-sm">&gt;|</button>
                                <div style="margin-left: 16px;">
                                    <label for="speedRange" style="margin-right: 6px;">Speed</label>
                                    <input id="speedRange" type="range" min="200" max="2000" step="100" value="800">
                                </div>
                            </div>

                            <!-- Bàn cờ: chessboard-element -->
                            <chess-board id="board" position="start" style="width: 480px; max-width: 100%;"></chess-board>

                            <div style="margin-top: 12px;">
                                <strong>Current:</strong>
                                <span id="currentInfo">Start position</span>
                            </div>
                        </div>

                        <!-- Cột bên phải: danh sách nước đi cho phép click để nhảy tới vị trí tương ứng -->
                        <div class="list-card">
                            <h5>Moves</h5>
                            <div id="movesList" class="moves-list">
                                <c:forEach var="m" items="${moves}" varStatus="st">
                                    <div class="move-item" data-index="${st.index}">
                                        <span style="min-width: 38px; display:inline-block;">#${m.move_number}</span>
                                        <span style="min-width: 50px; display:inline-block; text-transform: capitalize;">${m.player_color}</span>
                                        <span>${m.move_notation}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bảng dữ liệu chi tiết (tùy chọn) hiển thị toàn bộ metadata từng nước đi -->
            <div class="card height-auto">
                <div class="card-body">
                    <div class="heading-layout1">
                        <div class="item-title">
                            <h3>Move Details</h3>
                        </div>
                    </div>
                    <div class="table-responsive move-details-scroll">
                        <table class="table display data-table text-nowrap">
                            <thead>
                                <tr>
                                    <th>Move number</th>
                                    <th>Player</th>
                                    <th>Notation</th>
                                    <th>FEN</th>
                                    <th>Checkmate</th>
                                    <th>Created At</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${moves}">
                                    <tr>
                                        <td>${m.move_number}</td>
                                        <td>${m.player_color}</td>
                                        <td>${m.move_notation}</td>
                                        <td>${m.board_state_fen}</td>
                                        <td><c:choose><c:when test="${m.is_checkmate}">Yes</c:when><c:otherwise>No</c:otherwise></c:choose></td>
                                        <td>${m.created_at}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> <!-- dashboard-content-one -->
    </div> <!-- dashboard-page-one -->
</div> <!-- wrapper -->

<!-- Admin JS -->
<script src="${pageContext.request.contextPath}/admin/js/modernizr-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>

<script>
    // Biến moves lưu toàn bộ lịch sử nước đi, được build từ dữ liệu server-side
    const moves = [
        <c:forEach var="m" items="${moves}" varStatus="st">
        {
            fen: '<c:out value="${m.board_state_fen}"/>',
            number: ${m.move_number},
            color: '<c:out value="${m.player_color}"/>',
            notation: '<c:out value="${m.move_notation}"/>'
        }<c:if test="${not st.last}">,</c:if>
        </c:forEach>
    ];

    // State
    let idx = -1; // -1 đại diện cho trạng thái ban đầu trước khi có nước đi nào
    let timer = null;
    let speedMs = 800;

    const boardEl = document.getElementById('board');
    const currentInfoEl = document.getElementById('currentInfo');

    function updateActiveItem() {
        const items = document.querySelectorAll('.move-item');
        items.forEach(i => i.classList.remove('active'));
        if (idx >= 0 && idx < items.length) {
            items[idx].classList.add('active');
            items[idx].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }
    }

    function showIndex(newIdx) {
        if (newIdx < -1) newIdx = -1;
        if (newIdx >= moves.length) newIdx = moves.length - 1;

        idx = newIdx;
        if (idx === -1) {
            boardEl.setAttribute('position', 'start');
            currentInfoEl.textContent = 'Start position';
        } else {
            const m = moves[idx];
            boardEl.setAttribute('position', m.fen);
            currentInfoEl.textContent = `#${m.number} ${m.color}: ${m.notation}`;
        }
        updateActiveItem();
    }

    function play() {
        if (timer) return; // đang chạy rồi thì không tạo timer mới
        timer = setInterval(() => {
            if (idx >= moves.length - 1) {
                pause();
                return;
            }
            showIndex(idx + 1);
        }, speedMs);
        document.getElementById('btnPlayPause').textContent = 'Pause';
        document.getElementById('btnPlayPause').classList.remove('btn-warning');
        document.getElementById('btnPlayPause').classList.add('btn-danger');
    }

    function pause() {
        if (timer) {
            clearInterval(timer);
            timer = null;
        }
        document.getElementById('btnPlayPause').textContent = 'Play';
        document.getElementById('btnPlayPause').classList.remove('btn-danger');
        document.getElementById('btnPlayPause').classList.add('btn-warning');
    }

    // Gắn sự kiện cho các nút điều khiển bàn cờ
    document.getElementById('btnFirst').addEventListener('click', () => { pause(); showIndex(-1); });
    document.getElementById('btnPrev').addEventListener('click', () => { pause(); showIndex(idx - 1); });
    document.getElementById('btnPlayPause').addEventListener('click', () => { timer ? pause() : play(); });
    document.getElementById('btnNext').addEventListener('click', () => { pause(); showIndex(idx + 1); });
    document.getElementById('btnLast').addEventListener('click', () => { pause(); showIndex(moves.length - 1); });
    document.getElementById('speedRange').addEventListener('input', (e) => {
        speedMs = Number(e.target.value);
        if (timer) { pause(); play(); }
    });

    // Cho phép click vào dòng nước đi để nhảy tới trạng thái tương ứng
    document.getElementById('movesList').addEventListener('click', (e) => {
        const item = e.target.closest('.move-item');
        if (!item) return;
        const i = Number(item.dataset.index);
        pause();
        showIndex(i);
    });

    // Khởi tạo màn hình ở trạng thái ban đầu
    showIndex(-1);
</script>
</body>
</html>
