<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<button @click="fnPayment">결제</button>
	</div>
</body>
</html>
<script>
	const userCode = "imp73607421"; 
	IMP.init(userCode);
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
			fnPayment(){
				IMP.request_pay({
				    pg: "kakaopay.TC0ONETIME",
				    pay_method: "card",
				    merchant_uid: "test1",
				    name: "테스트 결제",
				    amount: 1,
				    buyer_tel: "010-0000-0000",
				  }	, function (rsp) { // callback
			   	      if (rsp.success) {
			   	        // 결제 성공 시
						alert("성공");
						console.log(rsp);
			   	      } else {
			   	        // 결제 실패 시
						alert("실패");
			   	      }
		   	  	});
			}
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>