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
		<button @click=fnApi>클릭</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
			fnApi(){
				var xhr = new XMLHttpRequest();
				
				var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'O%2FRrWSTIgEeHw1FKFd1x0b3qWc6PCPm43YDxjG82UDZvSm3LT9lMs2uUOqWAxp06QBIhF4%2BNQ%2FgEXOwpne1eVg%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
				queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
				queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
				queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
				queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
				queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
				xhr.open('GET', url + queryParams);
				
				xhr.onreadystatechange = function () {
				    if (this.readyState == 4) {
						var responseJson = JSON.parse(this.responseText);
				        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
						var items = responseJson.response.body.items.item;
						for (var i = 0; i < items.length; i++) {
							var item = items[i];
							console.log(item); 
						}
				    }
				};

				xhr.send('');
			}
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>