<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>여행지 상세 페이지</title>
    <style>
        .container{
            margin: auto;
            height: 1400px;
            width: 1200px;
        }
        .product_category_list > a:not(:last-child):after {
        content: '';
        display: inline-block;
        width: 2px;
        height: 15px;
        background: #999;
        position: relative;
        top: 2px;
        margin-left: 13px;
       }
       .product_category_list > a {
        margin: 0 5px;
       }
       .product_category_list{
        text-align: center;
        margin-top: 10px;
        margin-bottom: 10px;
       }
        .container .travelBanner{
            text-align: center;
        }
        .container #travelBanner2{
            width: 1200px;
            height: 400px;
            margin-bottom: 30px;
        }
        #explane h1{
            font-size: 35px;
            text-align: center;
            margin-bottom: 50px;
        }
        #miniExplane h1{
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        #picture1 #boracay{
            width: 1000px;
            height: 350px;
        }
        .container #picture1{
            text-align: center;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        .container hr{
            margin-bottom: 20px;
        }
        
        #api #box{
            width: 1000px;
            height: 200px;
            border: 1px solid black;
            background-color: gray;
            text-align: center;
        }
        #api #apiExplane{
            margin-bottom: 20px;
        }
        #api #apiBox{
            text-align: center;
            margin-bottom: 40px;
            margin-left: 100px;
        }
        .fundingBtn button{
            border: 1px solid black;
            border-radius: 50px;
            padding: 20px 30px;
            background-color: black;
            color: white;
            margin-left: 510px;
        }
   
    </style>
</head>
<body>
<div id="app">
       <div id="wrapper">
        <div class="container">

		<div class="prodCategoryList">
			<ul>
				<li class="prodCategoryList_li" v-for="(item, index) in catList"
					@click="fnChange(item.code)"><template
						v-if="item.code == pKind">
						<b>{{item.name}}</b>
					</template>
					<template v-else>{{item.name}}</template></li>
			</ul>
		</div>
            <div class="travelBanner"><img :src="info.imgsrc" id="travelBanner2"></div>
            <div id="explane">
                <h1>{{info.tName}}</h1>
            </div>
            <div id="miniExplane">
                <h1>{{info.tContent}}</h1>
            </div>
            <template v-for="(item, index) in list">
	            <div class="picture1">
	                <img :src="item.imgsrc" id="boracay">
	            </div>
            </template>
            <hr>
            <div id="api">
                <div id="apiExplane">보라카이 API</div>
                <div id="apiBox">
                    <div id="box">api 넣을거임</div>
                </div>
            <hr>  
            <div class="fundingBtn">
                <button class="btn1" @click="fnFunding(tripNo)">펀딩레지스트리 등록</button>
            </div>
            
            </div>
        </div>
    </div>
</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	catList : [],
        pKind : "A",
        tripNo : "${map.tripNo}",
        info:{},
        list:{},
    	status: "${sessionStatus}",
    }   
    , methods: {
    	fnChange : function(code){
	        var self = this;
	
	        self.keyword = "";
	        if(code == "W"){
	            location.href="/prod5Sub0.do";
	        }else if(code == "A"){
	            location.href="/triprecommend.do";
	        }else if(code == "B"){
	            location.href="/bedroom.do";
	        }else if(code == "L"){
	            location.href="/livingroom.do";
	        }else if(code == "D"){
	            location.href="/dressroom.do";
	        }else if(code == "K"){
	            location.href="/kitchen.do";
	        }else if(code == "V"){
	            location.href="/utilityroom.do";
	        }else if(code == "T"){
	            location.href="/toilet.do";
	        }else if(code == "H"){
	            location.href="/hobby.do";
	        }else{
	            location.href="/main.do";
	        }
    	}
    	,fnGetCategoryList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/categoryList.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    self.catList = data.code;
                    }
             }); 
        }
    	,fnGetInfo : function(){
            var self = this;     
            var nparmap = {tripNo : self.tripNo,};
            $.ajax({
                url: "/tripView.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data)
                	self.info = data.info;
                   
                }
            }); 
        }
        ,fnGetImg : function(){
            var self = this;     
            var nparmap = {tripNo : self.tripNo};
            $.ajax({
                url: "/tripImg.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data)
                	self.list = data.list;
                   
                }
            }); 
        }
        ,fnFunding :function(tripNo){
	    	var self = this;
	    	self.pageChange("", {tripNo : tripNo});
	    }
       
    }   
    , created: function () {
    	var self = this;
    	self.fnGetCategoryList();
    	self.fnGetInfo();
    	self.fnGetImg();

	}
});
</script>