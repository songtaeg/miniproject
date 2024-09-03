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
	 도/시
	 	<select v-model="si" @change="fnGetArea">
			<option value="">::선택::</option>
			<option v-for="item in siList" :value="item.si">{{item.si}}</option>
		</select>
	구/군
		<select v-model="gu" @change="fnGetArea">
			<option value="">::선택::</option>
			<option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
		</select>
	동/면/리
		<select v-model="dong" @change="fnGetArea">
			<option value="">::선택::</option>
			<option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
		</select>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				si:"",
				siList:[],
				gu:"",
				guList:[],
				dong:"",
				dongList:[],
            };
        },
        methods: {
			fnGetArea(){
				var self=this;
				if(self.si==""){
					self.guList=[];
					self.dongList=[];
				}
				var nparmap ={
					si: self.si,
					gu: self.gu,
					dong: self.dong
				};
				$.ajax({
					url:"area.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.list);
						if(self.si !=""){
							self.guList=data.list;
							self.dongList=data.list;
						}else{
							self.siList=data.list;
						}
						
					}
				});
			}
        },
        mounted() {
			var self = this;
			this.fnGetArea();
        }
    });
    app.mount('#app');
</script>