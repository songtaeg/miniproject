<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<!-- Quill CDN -->
	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
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
		<table>
			<tr>
				<th>제목</th>
				<td><input v-model="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div id="editor"></div></td>
			</tr>	
		</table>	
		<button id="btn" @click="fnSave()">저장</button>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				title : "",
				contents : ""
            };
        },
        methods: {
            // fnSave 생성 후 board-add.dox 호출해서 저장
			fnSave(){
				var self = this;
				var nparam = {title : self.title, contents : self.contents};
				$.ajax({
					url:"board-add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						alert(data.message);
						if(data.result == "success"){
							location.href = "board-list.do"
						}
					}
				});
			}
        },
        mounted() {
			// Quill 에디터 초기화
			       var quill = new Quill('#editor', {
			           theme: 'snow',
			           modules: {
			               toolbar: [
			                   [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
			                   ['bold', 'italic', 'underline'],
			                   [{ 'list': 'ordered'}, { 'list': 'bullet' }],
			                   ['link', 'image'],
			                   ['clean']
			               ]
			           }
			       });

			       // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
			       quill.on('text-change', function() {
			           app.contents = quill.root.innerHTML;
			       });
        }
    });
    app.mount('#app');
</script>