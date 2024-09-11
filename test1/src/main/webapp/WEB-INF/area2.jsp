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
	 	<select v-model="si" @change="fnGuList">
			<option value="">::전체::</option>
			<option v-for="item in siList" :value="item.si">{{item.si}}</option>
		</select>
	구/군
		<select v-model="gu" @change="fnDongList">
			<option value="">::선택::</option>
			<option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
		</select>
	동/면/리
		<select v-model="dong" @change="">
			<option value="">::선택::</option>
			<option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
		</select>
		<button @click=fnNxNy>클릭</button>
		<hr>
		<div>
			{ {{ nxnyList.nx }},{{ nxnyList.ny }} } 
		</div>		
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
				nxnyList:[],
				nx:"",
				ny:""
            };
        },
        methods: {
			fnSiList(){
				var self=this;
				var nparmap ={};
				$.ajax({
					url:"si-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.siList=data.siList;
					}
				});
			},
			fnGuList(){
				var self=this;
				var nparmap ={
					si:self.si
				};
				$.ajax({
					url:"gu-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.guList=data.guList;
					}
				});
			},
			fnDongList(){
				var self=this;
				var nparmap ={
					si:self.si,
					gu:self.gu
				};
				$.ajax({
					url:"dong-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.dongList=data.dongList;
					}
				});
			},
			fnNxNy(){
				var self=this;
				var nparmap ={
					si:self.si,
					gu:self.gu,
					dong:self.dong,

				};
				$.ajax({
					url:"nxny-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.nx=data.nx;
						self.ny=data.ny;
					}
				});
			}
        },
        mounted() {
			var self = this;
			this.fnSiList();
        }
    });
    app.mount('#app');
</script>