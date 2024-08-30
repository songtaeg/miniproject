<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		학번: {{info.stuNo}}<br>
		이름: {{info.name}}<br>
		학부: {{info.dpart}}<br>
		학과: {{info.dname}}<br>
		담당교수: {{info.profname}}<br>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				stuNo:'${stuNo}',
				info:{}
            };
        },
        methods: {
			fnGetInfo(){
				var self = this;
				var nparmap = {stuNo:self.stuNo};
				$.ajax({
					url: "school-stuView.dox",
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