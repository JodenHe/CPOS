<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>vue learning!</title>
</head>
<body>
	<div id="app">
		<p>{{ message }}</p>
		<!-- 利用 v-bind 指令进行数据绑定 -->
		<input type="text" v-bind:value="message"/>
	</div>
	<!-- 条件与循环 -->
	<div id="app-3">
		<p v-if="seen">现在你可以看到我</p>
	</div>
	<div id="app-4">
	  <ol>
	    <li v-for="todo in todos">
	      {{ todo.text }}
	    </li>
	  </ol>
	</div>
	<!-- 处理用户输入 -->
	<!-- 为了让用户和你的应用程序进行交互，我们可以使用 v-on 指令 来增加事件监听器，触发事件后会调用 Vue 实例中 methods 下定义的方法 -->
	<div id="app-5">
	  <p>{{ message }}</p>
	  <button v-on:click="reverseMessage">翻转 message</button>
	</div>
	<!-- v-model,区别与v-bind:value，model可进行编辑绑定 -->
	<div id="app-6">
	  <p>{{ message }}</p>
	  <span v-once>这里的值永远不会改变：{{ message }}</span>
	  <input v-model="message">
	</div>



	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script type="text/javascript" src="https://unpkg.com/vue"></script>
	<script type="text/javascript">
		var app = new Vue({
			el: '#app',
			data: {
				message: 'Hello Vue.js!'
			}
		});
		var app3 = new Vue({
			el: '#app-3',
			data: {
				seen: true
			}
		});
		var app4 = new Vue({
			el: '#app-4',
			data: {
				todos: [
			      { text: '学习 JavaScript' },
			      { text: '学习 Vue' },
			      { text: '创建激动人心的代码' }
			    ]
			}
		});
		var app5 = new Vue({
		  el: '#app-5',
		  data: {
		    message: 'Hello Vue.js!'
		  },
		  methods: {
		    reverseMessage: function () {
		      this.message = this.message.split('').reverse().join('');
		    }
		  }
		});
		var app6 = new Vue({
			el: '#app-6',
			data: {
				message: '测试数据'
			}
		});
		

	</script>
</body>
</html>