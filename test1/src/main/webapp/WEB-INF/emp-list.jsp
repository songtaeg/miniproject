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
		<div style="margin: 10px;">
			<input type="checkbox" value="10" v-model="deptNo">ACCOUNTING
			<input type="checkbox" value="20" v-model="deptNo">RESEARCH
			<input type="checkbox" value="30" v-model="deptNo">SALES
			<input type="checkbox" value="40" v-model="deptNo">OPERATIONS
		</div>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직급</th>
				<th>부서번호</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.empNo}}</td>
				<td>{{item.eName}}</td>
				<td>{{item.job}}</td>
				<td>{{item.deptNo}}</td>
		</table>	
		<!--{{list}}-->
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				list : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"empList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>