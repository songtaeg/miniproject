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
		<ul  style="margin: 20px;">
			<li><a href="#" @click="fnCategory('')"> 전체</a></li>
			<li><a href="#" @click="fnCategory(1)"> 공지사항</a></li>
			<li><a href="#" @click="fnCategory(2)"> 자유게시판</a></li>
			<li><a href="#" @click="fnCategory(3)"> 질문게시판</a></li>
		</ul>
		
		<div style="margin : 20px;"> 
			<select style="margin-right:5px;" v-model="searchOption">
				<option value="all">::전체::</option>
				<option value="title">제목</option>
				<option value="name">작성자</option>
			</select>
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
				<th>카테고리</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardNo}}</td>
				<td><a href="#" @click="fnView(item.boardNo)">{{item.title}}</a></td>
				<td>{{item.userName}}</td>
				<td>{{item.hit}}</td>
				<td>{{item.cdateTime}}</td>
				<td>{{item.category}}
				<td>
					<div v-if="sessionEmail == item.email || sessionStatus=='A' ">
						<button @click="fnRemove(item.boardNo)">삭제</button>
					</div>
				</td>
			</tr>	
		</table>
		<div>
			<button @click=fnInsert>글쓰기</button>
		</div>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword : "",
				searchOption:"all",
				category:"",
				sessionId:'${sessionId}',
				sessionStatus:'${sessionStatus}',
				sessionEmail:'${sessionEmail}'
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					keyword : self.keyword,
					searchOption:self.searchOption,
					category:self.category
				};
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
			},
			fnCategory(category){
				var self=this;
				self.category=category;
				self.fnGetList();
			},
			fnInsert(){
				$.pageChange("board-insert2.do",{})
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>