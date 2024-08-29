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
		<div>제목: {{ info.title }} </div><br>
		<div>내용: {{ info.contents }}</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				boardNo:'${boardNo}',
				info : {}
            };
        },
        methods: {
			fnGetInfo(){
				var self = this;
				var nparmap = {keyword : self.boardNo};
				$.ajax({
					url: "board-view.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.info = data.info;
					}
				});
			} 
        },
        mounted() {
			var self = this;
			self.fnGetInfo();
        }
    });
    app.mount('#app');
</script>