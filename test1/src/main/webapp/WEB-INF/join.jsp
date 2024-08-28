<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<body>
	<div id="app">
		<div>
			아이디 : <input placeholder="아이디" v-model="userId">
			<button @click="fnIdCheck()">중복체크</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId:""
            };
        },
        methods: {
			fnIdCheck(){
				var self = this;
				var nparam = {userId:self.userId};
				$.ajax({
					url:"idCheck.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
						console.log(data); 
						if(data.info==undefined){
							alert("사용 가능한 아이디");
						}else{
							alert("이미 사용중인 아이디");
						}
					}
				});	
			}
        },
		mounted(){
			
		}
    });
    app.mount('#app');
</script>