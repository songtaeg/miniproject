<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>상세 페이지</title>
</head>
<body>
	<div id="app">
		<div>이름:{{info.userName}}</div>
		<div>아이디:{{info.userId}}</div>
		<div>이메일:{{info.email}}</div>
		<button @click="fnRemove()">삭제</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId:'${userId}',
				info:{}
            };
        },
        methods: {
			fnGetInfo(){
				var self = this;
				var nparmap = {userId: self.userId};
				$.ajax({
					url:"idCheck.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.info=data.info;
					}
				});
			},			
			fnRemove(){
				//console.log(userId);

				var self = this;
				var nparam = {userId:self.userId};
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
						$.pageChange("user-list.do",{});
						//console.log(data);
					}
				});
			},
			 
        },
        mounted() {
			var self = this;
			self.fnGetInfo();
        }
    });
    app.mount('#app');
</script>