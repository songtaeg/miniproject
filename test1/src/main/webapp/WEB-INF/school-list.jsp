<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	<title>view 기본 세팅 파일</title>
	
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
	
	.pagination {
		    justify-content: center;
		    align-items: center;
		    margin: 20px 0;
		}
		.pagination button {
		    background-color: #f8f9fa;
		    border: 1px solid #dee2e6;
		    color: #007bff;
		    padding: 8px 12px;
		    margin: 0 2px;
		    cursor: pointer;
		    transition: background-color 0.3s, color 0.3s;
		    border-radius: 4px;
		}

		.pagination button:hover {
		    background-color: #007bff;
		    color: white;
		}

		.pagination button.active {
		    background-color: #007bff;
		    color: white;
		    cursor: default;
		}

		.pagination button:disabled {
		    background-color: #e9ecef;
		    color: #6c757d;
		    cursor: not-allowed;
		    border: 1px solid #dee2e6;
		}

		.pagination button:not(.active):not(:disabled):hover {
		    background-color: #0056b3;
		    color: white;
		}
</style>
<body>
	<div id="app">
		<span class="material-symbols-outlined">	
		home
		</span>
		<span class="material-symbols-outlined">
		search
		</span>
		<select v-model="selectSize "@change="fnGetList(1)">
			<option value="5">5개</option>
			<option value="10">10개</option>
			<option value="20">20개</option>
		</select>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>아이디</th>
				<th>학년</th>
				<th>주민번호</th>
			<tr>
			<tr v-for="item in list">
				<td>{{item.stuNo}}</td>
				<td><a href="#" @click=fnView(item.stuNo)>{{item.name}}</a></td>
				<td>{{item.id}}</td>
				<td>{{item.grade}}</td>
				<td>{{item.jumin}}</td>
			</tr>	
		</table>
		<!--<button @click="fnInsert">학생 추가</button>-->	
		
		<div class="pagination">
		    <button v-if="currentPage > 1" >이전</button>
		    <button v-for="page in totalPages" 
				:class="{active: page == currentPage}"
				@click=fnGetList(page)>
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages">다음</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list:[],
				currentPage: 1, //현재 페이지  
				totalPages: 1, 
				selectSize: 10
            };
        },
        methods: {
			fnGetList(page){
				var self = this;
				self.pageSize=self.selectSize;
				self.currentPage=page;
				
				var startIndex=(page-1)*self.pageSize;
				var outputNumber=self.pageSize;
				
				var nparmap = {
					startIndex:startIndex,
					outputNumber:outputNumber,
				};
				$.ajax({
					url:"school-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						self.totalPages = Math.ceil(data.count/self.pageSize); //올림, 동적 생성
					}
				});
			},
			fnView(stuNo){
				$.pageChange("school-stuView.do",{stuNo:stuNo});
			},
			fnInsert(){
				$.pageChange("school-insert.do",{});
			}
        },
        mounted() {
			var self = this;
			self.fnGetList(self.currentPage);
        }
    });
    app.mount('#app');
</script>