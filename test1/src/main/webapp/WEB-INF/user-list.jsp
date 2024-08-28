<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>user 리스트 출력</title>
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
		<button @click="fnboardList">게시글 목록(userControll에서 작성)</button>
		<div>
			<input placeholder="검색" v-model="keyword">
			<button @click="fnUserList">검색</button>
		</div>
		<!--<div>{{userList}}</div>-->
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in userList">
				<td>{{item.userId}}</td>
				<td><a href="#" @click="fnUserView(item.userId)">{{item.userName}}</a></td>
				<td>{{item.email}}</td>
				<td><button @click="fnRemove(item.userId)">삭제</button></td>
		</table>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList:[],
				keyword: ""
            };
        },
        methods: {
			fnUserList(){
				var self = this;
				var nparam = {keyword : self.keyword};
				$.ajax({
					url:"user-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						console.log(data);
						self.userList=data.list;
					}
				});
			},
			
			fnboardList(){
				var self = this;
				var nparam = {};
				$.ajax({
					url:"board.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						console.log(data);
					}
				});
			},
			
			fnRemove(userId){
				//console.log(userId);

				var self = this;
				var nparam = {userId:userId};
				if(!confirm("삭제 하시겠습니까?")){
					return;
				};
				$.ajax({
					url:"delete.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						alert('삭제 완료');
						self.fnUserList();
						//console.log(data);
					}
				});
			},
			
			fnUserView(userId){
				$.pageChange("user-view.do",{userId: userId});
			}
        },
        mounted() {
			var self=this;
			self.fnUserList();
        }
    });
    app.mount('#app');
</script>