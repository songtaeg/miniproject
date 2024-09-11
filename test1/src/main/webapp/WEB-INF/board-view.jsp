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
		제목: {{ info.title }} <br>
		내용: <div v-html="info.contents"></div>
		작성자:<span> {{info.userId}}</span>
		<div v-if="sessionId == info.userId || sessionStatus =='A' ">
			<button>삭제</button>
		</div>
		<hr>
		댓글: 	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				boardNo:'${boardNo}',
				info : {},
				sessionId:'${sessionId}',
				sessionStatus:'${sessionStatus}'
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