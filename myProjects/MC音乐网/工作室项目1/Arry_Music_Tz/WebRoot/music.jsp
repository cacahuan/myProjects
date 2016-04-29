<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>面试资本课 - QQ音乐播放器插件二 - Arry老师</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">

		<style type="text/css">
			*{margin:0;padding:0;}
			body{background:url("images/bg.jpg") no-repeat top center;font-size:12px;font-family:"微软雅黑";color:#666;}

			/*music start*/
			.music{width:720px;height:470px;background:#E8E8E8;margin:100px auto;}
			.music .m_lrc{width:50%;height:470px;background:#000;float:left;}
			.music .m_list{width:50%;height:470px;background:#262c35;float:left;}
			.music .m_lrc h2{line-height:60px;background:#ccc;text-align:center;font-size:24px;font-weight:500;}
			.music .m_lrc .m_con{width:360px;height:410px;background:url("images/music.gif") no-repeat top center;overflow: auto;}
			.music .m_list ul li{border-bottom:1px solid #1b1f25;line-height:36px;list-style:none;padding-left:15px;}
			.music .m_list ul li a{text-decoration:none;color:#fff;font-size:14px;}
			/*end music*/
			#lrc{width:600px;height:300px;display:none;}
			.lrcline{color:#AAA;line-height:26px;padding-left:10px;}
		
			::-webkit-scrollbar{width:10px;height:6px;background:#ccc;}
			::-webkit-scrollbar-button{background-color:#e5e5e5;}
			::-webkit-scrollbar-track{background:#999;}
			::-webkit-scrollbar-track-piece{background:#ccc}
			::-webkit-scrollbar-thumb{background:#666;}
			::-webkit-scrollbar-corner{background:#82AFFF;}
			::-webkit-scrollbar-resizer{background:#FF0BEE;}
			scrollbar{-moz-appearance:none !important;background:rgb(0,255,0) !important;}
			scrollbarbutton{-moz-appearance:none !important;background-color:rgb(0,0,255) !important;}
			scrollbarbutton:hover{-moz-appearance:none !important;background-color:rgb(255,0,0) !important;}
			
			.sel{color:red;font-size:20px;}

		</style>

	</head>
<body>

	<!--music start-->
	<div class="music">
		<div class="m_lrc">
			<h2 id="m_title"></h2>
			<div class="m_con" id="lrcbox">
				
			</div>
		</div>
		<div class="m_list">
			<ul>
				<li><a href="#" onclick="play(1,this);" class="mu">相亲相爱的一家人</a></li>
				<li><a href="#" onclick="play(2,this);">年轻的战场</a></li>
				<li><a href="#" onclick="play(3,this);">海阔天空</a></li>
				<li><a href="#">以后的以后</a></li>
				<li><a href="#">追梦赤子心</a></li>
				<li><a href="#">天边</a></li>
				<li><a href="#">海阔天空</a></li>
				<li><a href="#">故乡的原风景</a></li>
				<li><a href="#">以后的以后</a></li>
				<li><a href="#">追梦赤子心</a></li>
				<li><a href="#">天边</a></li>
				<li><a href="#">天边</a></li>
			</ul>
		</div>
	</div>
	<!--end music-->

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
	// 创建一个mp3的播放器
	var audioDom = document.createElement("audio");	
	// 点击播放
	function play(name,obj){
		// 设置音乐地址
		audioDom.src = "mp3/"+name+".mp3";		
		// 控制自动播放
		audioDom.autoplay = "autoplay";
		// 加载音乐歌词
		loadLrc(name);
		// 动态加载歌名
		$("#m_title").text($(obj).text());
		
		// 联动音乐播放歌词
		audioDom.addEventListener("timeupdate",function(){
			// 获取当前播放的时间
			var timer = this.currentTime;
			// 解析音乐对应的时间
			var m = parseInt(timer / 60);
			// console.log("timer ==========="+timer);
			var s = parseInt(timer);
			for(var i = 0; i < s; i++){
				$("#"+i).addClass("sel").siblings().removeClass("sel");
			}
			
			var st = m * 60 + s;
			
			$("#lrcbox").scrollTop(st*5);
			
		});
		
	}
	
	//play(1,$(".m_list").find(".mu"));
	
	// 从服务器动态加载歌词
	function loadLrc(name){
		$.ajax({
			type:"post",
			url:"data.jsp",
			data:{"name":name},
			success:function(data){
				var lrc = data;
				// 把时间和歌词分离出来
				var lrcArr = lrc.split("[");
				var htmlLrc = "";
				for(var i = 0; i < lrcArr.length; i++){
					// 第二次分割“]”
					var arr = lrcArr[i].split("]");
					//console.log("=============="+arr);
					// 取到时间
					var timer = arr[0].split(".");
					// 取到歌词
					var message = arr[1];
					// console.log("时间："+timer+"  歌词："+message);
					// 取到分钟和秒
					var stime = timer[0].split(":");
					// console.log("-------"+stime); // 00,18
					// 转换成秒数 00:18
					var ms = stime[0]*60 + stime[1]*1 - 1;
					if(message){
						htmlLrc += "<div class='lrcline' id='"+ms+"'>"+message+"</div>";
					}
				}
				// 把解析好的歌词放入div中
				$(".m_con").html(htmlLrc);
			}
		});
	}
</script>

</body>
</html>