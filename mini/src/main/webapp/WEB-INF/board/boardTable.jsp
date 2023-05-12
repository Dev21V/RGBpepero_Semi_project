<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board30.css">
	<title>BoardTable</title>
</head>
<body>
    <div id="app">
        <!-- wrap START -->
        <div id="wrapper">
            <div class="boardbox">
                <div id="boardname">{{boardName}}</div>
                <select v-model="selectItem" v-if="boardKind == 3">
                    <option value="">:: 전체 ::</option>
                    <option value="P">상품관련</option>
                    <option value="A">계정관련</option>
                    <option value="D">배송관련</option>
                </select>
            </div>
            <div class="table_list">            
                <table class="board_list">
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col"></th>
                        <th scope="col">글 제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회</th>
                        <th scope="col">시간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr  v-for="(item, index) in list"  @click="fnView(item.boardNo)">
                        <td>{{index + 1}}</td>
                        <template>
	                        <td v-if="item.replyYn == 'Y'"><span><img src="/image/qa_icon2.gif"></span></td>
	                        <td v-else><span><img src="/image/qa_icon1.gif"></span></td>
                        </template>
                        <td>{{item.title}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.viewCnt}}</td>
                        <td>{{item.cdatetime}}</td>
                    </tr>
                </tbody>
            </table>
            </div>
            <div class="pagecontroll">
                < 1 2 3 >
            </div>
            <!-- <div id="btn_box">
					<button @click="fnAdd()" class="btn">새 글 작성</button>
		</div> -->
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
    		, /* boardKind : "3" */
    		, selectItem : ""
    	
        }
    	,watch : {
    		selectItem :function(){
    			var self = this;
    			self.fnGetList();
    		}
    	}
        , methods: {
            fnGetList : function(){
                var self = this;
                var nparmap = {boardKind : self.boardKind ,keywordType : self.selectItem};
                $.ajax({
                    url:"/board/list.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.list = data.board;
                    	
                        console.log(data);
                    }
                }); 
            }, 
            fnInquery : function(){
        		location.href = "/inquery.do";
        	},
        	fnAnounce : function(){
        		location.href = "/notice.do";
        	}
        	, pageChange : function(url, param) {
	    		var target = "_self";
	    		if(param == undefined){
	    		//	this.linkCall(url);
	    			return;
	    		}
	    		var form = document.createElement("form"); 
	    		form.name = "dataform";
	    		form.action = url;
	    		form.method = "post";
	    		form.target = target;
	    		for(var name in param){
					var item = name;
					var val = "";
					if(param[name] instanceof Object){
						val = JSON.stringify(param[name]);
					} else {
						val = param[name];
					}
					var input = document.createElement("input");
		    		input.type = "hidden";
		    		input.name = item;
		    		input.value = val;
		    		form.insertBefore(input, null);
				}
	    		document.body.appendChild(form);
	    		form.submit();
	    		document.body.removeChild(form);
	    	}
			, fnView : function(boardNo){
	    		var self = this;
	    		self.pageChange("./readBoard.do", {boardNo : boardNo});
	    	}
        	, fnAdd : function(boardKind){
	    		var self = this;
	    		self.pageChange("./board3.do", {boardKind : self.boardKind});
	    	}/* ,
        	fnReadBoard: function(){
            	var self = this;
            	
    	        if(self.boardKind == '1'){
    	        	self.boardName = "공지사항";
    	        }else if(self.boardKind == '2'){
    	        	self.boardName = "문의하기";
    	        }else if(self.boardKind == '3'){
    	        	self.boardName = "자주하는 질문";
    	        }
    	        else{
    	        	self.boardName = "Error!";
    	        }
    	        console.log(self.boardKind);
    	        console.log(self.boardName);
            } */
        }   
        , created: function () {
            var self = this;/* 
            self.ReadBoard(); */
            self.fnGetList();
    
        }
    });
    </script>
</html>