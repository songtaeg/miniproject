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
		<div>
			아이디 : <input placeholder="아이디" v-model="userId">
			<button @click="fnIdCheck">중복체크</button>
		</div>
		<div>
			비밀번호 : <input type="password" v-model="pwd"><br>
			비밀번호 확인: <input type="password" v-model="pwdcheck">
		</div>
		<div>
			주소 : <input type="text" class="in" placeholder="주소" v-model="roadFullAddr"></input>
			<button @click="fnSearchAddr">주소 검색</button>
		</div>
		<div>
			핸드폰 번호:<input type="tel" v-model="phone">
		</div>	
		<div>
			<button @click="fnRegister">회원가입</button>
		</div>
	</div>
</body>
</html>
<script>
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		if (window.vueAppInstance) {
			window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
		} else {
			console.error("Vue app instance is not available.");
		}
	}
    const app = Vue.createApp({
        data() {
            return {
				id:"",
				pwd:"",
				pwdcheck:"",
				roadFullAddr:"",
				phone:""
            };
        },
        methods: {
			fnIdCheck(){
				var self = this;
				//var regExp = /^[a-zA-Zㄱ-힣]*$/;
				var nparam = {userId:self.userId};
				$.ajax({
					url:"idCheck.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) {
						console.log(data);
						if(self.userId.length < 4 || !regExp.test(self.userId)){
							alert("아이디는 4글자 이상이거나 영어와 한글을 포함해야 합니다.");
							return;
						}
						if(data.info==undefined){
							alert("사용 가능한 아이디");
						}else{
							alert("이미 사용중인 아이디");
						}
					}
				});	
			},
			fnSearchAddr(){
				var self = this;
				var option = "width = 500, height = 500, top = 100, left = 200, location = no"
				window.open("addr.do", "addr", option);
			},
			fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				var self = this;
				self.roadFullAddr = roadFullAddr;
				// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
				console.log(roadFullAddr);
				console.log(roadAddrPart1);
				console.log(addrDetail);
				console.log(engAddr);
			},
			fnRegister(){
				var self = this;
				if (this.pwd !== this.pwdcheck) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
			}
        },
        mounted() {
			window.vueAppInstance = this;
        }
    });
    app.mount('#app');
</script>