<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table {
		margin : 20px;
	}
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse: collapse;
	}
</style>
<body>
	<div id="app">
		<div style="margin : 20px;"> 
			검색 : <input placeholder="검색어" v-model="keyword">
			<button @click="fnGetList">검색</button>
		</div> 
		<table>
			<tr>
				<th>게시글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardNo}}</td>
				<td><a href="#" @click="fnView(item.boardNo)">{{item.title}}</a></td>
				<td>{{item.userId}}</td>
				<td>{{item.hit}}</td>
				<td>{{item.cdateTime}}</td>
				<td><button @click="fnRemove(item.boardNo)">삭제</button></td>
			</tr>	
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {keyword : self.keyword};
				$.ajax({
					url:"board-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            },
			fnRemove(num) {
				var self = this;
				var nparmap = {boardNo : num};
				$.ajax({
					url:"board-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						self.fnGetList();
					}
				});
			},
			fnView(boardNo){
				//key:boardNo,value:내가 누른 게시글의 boardNo(pk)
				$.pageChange("board-view.do",{boardNo: boardNo});
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>