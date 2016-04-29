<!--JS start-->
 <script style="text/javascript" src="js/jquery.js"></script>
	<script style="text/javascript">
		$(function(){
			$("#mc .player .p_backup").click(function(){
				var width=$("#mc .player").width()-22;//获取整个播放区域的长度
				var left=$("#mc .player").offset().left;//获取距离左边的距离
				var n=1;
				if(left<0){
					n=0;
					$("#mc .player .p_backdown").addClass("#mc .player p_backme");
				}
				$("#mc .player").animate({left:-width*n},1000,function(){
					if(n==0){
						$("#mc .player .p_backup").removeClass("#mc .player p_backdown").removeClass("#mc .player p_backme");
					}
					else{
						$("#mc .player .p_backup").addClass("#mc .player p_backdown");
					}
				});
				
			});
			
			//初始化播放器
			var audioDom = createMP3("mp3/1.mp3");
			//播放
			$(".b_play").click(function(){	
				$(this).hide();//隐藏播放图标
				$(".b_stop").show();//同时显示暂停图标
				audioDom.play();//再播放
			});
			//暂停
			$(".b_stop").click(function(){
				$(this).hide();//隐藏暂停图标
				$(".b_play").show();//同时显示播放图标
				audioDom.pause();//再暂停
			});
		
		});
		//创建一个播放器
		function createMP3(src){
			
			var audioDom = document.createElement("audio");
			//创建地址
			audioDom.src = src;
			return audioDom;
		}
				
	</script>