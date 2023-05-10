<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board30.css">
	<title>FAQ</title>
</head>
<body>
    <div id="app">
        <!-- wrap START -->
        <div id="wrapper">
            <div class="bannerbox">
                <div class="banner">
                    <div class="textbox">
                        <p class="txt">Frequently Asked Questions</p>
                    </div>
                </div>
            </div>
            <div id="menu">
                <span id="announce" class="boardmenu" onclick="location.href='#'">공지사항</span>
                <span id="inquery" class="boardmenu" onclick="location.href='#'">문의하기</span>
                <div class="line"></div>
            </div>
            <div class="boardbox">
                <div id="boardname">자주하는 질문</div>
                <select>
                    <option>상품관련</option>
                    <option>계정관련</option>
                    <option>배송관련</option>
                </select>
            </div>
            <div class="table_list">
                <table class="board_list">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th></th>
                            <th>글 제목</th>
                            <th>작성자</th>
                            <th>조회</th>
                            <th>시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                        <tr>
                            <td>{{index + 1}}</td>
                            <td>아이콘</td>
                            <td>{{item.title}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cdatetime}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="pagecontroll">
                < 1 2 3 >
            </div>
        </div>
        <!-- wrap END -->
    </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
            list : [],
            checkList : []
        }   
        , methods: {
            fnGetList : function(){
                var self = this;
                var nparmap = {};
                $.ajax({
                    url:"/bbs/list.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        console.log(data);
                    }
                }); 
            } 
        }   
        , created: function () {
            var self = this;
     
    
        }
    });
    </script>
</html>