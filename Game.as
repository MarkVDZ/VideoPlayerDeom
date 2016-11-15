package  {
	
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.media.Video;
	import flash.events.*
	import fl.video.VideoPlayer;
	import fl.video.NCManager;
	import fl.video.VideoEvent;
	import flash.display.SimpleButton;

	fl.video.VideoPlayer.iNCManagerClass = fl.video.NCManager
	
	public class Game extends MovieClip {
		
		var player:VideoPlayer
		var eStop:VideoPlayer
		var dele:Deleteb = new Deleteb()
		var expand:Expand = new Expand()
		var fill:Fill = new Fill()
		var lab:Labelb = new Labelb()
		var wash:Wash = new Wash()
		var dump:Dump = new Dump()
		
		public function Game() {
			gotoAndStop(1)
			player = new VideoPlayer(1400, 800)
			eStop = new VideoPlayer(1400, 800)
			player.load("MainProxy.mp4")
			eStop.load("test2.mp4")
			//player.play()
			player.autoRewind = true
			eStop.autoRewind = true
			addChild(player)
			addChild(dele)
			dele.x = 100
			dele.y = 400
			
			/*addChild(dumpFull)
			dumpFull.x = 600*/
			addChild(expand)
			expand.x = 400
			addChild(fill)
			fill.y = 200
			addChild(lab)
			lab.y = 600
			addChild(wash)
			wash.y = 800
			addChild(dump)
			
			
			stage.addEventListener(MouseEvent.CLICK, handleStart)
			bttnPlay.addEventListener(MouseEvent.CLICK, handlePlay)
			bttnPause.addEventListener(MouseEvent.CLICK, handlePause)
			bttnSwitch.addEventListener(MouseEvent.CLICK, handleSwitch)
			//b.addEventListener(MouseEvent.CLICK, handleTwo)
			backBttn.addEventListener(MouseEvent.CLICK, handleMain)
			eStop.addEventListener(fl.video.VideoEvent.COMPLETE, endStop)
			addEventListener(MouseEvent.CLICK, handleClick)
			
			backBttn.visible = false
			bttnPlay.visible = false
			bttnPause.visible = false
			bttnSwitch.visible = false
			player.visible = false
			
			stage.scaleMode = StageScaleMode.EXACT_FIT
			//stage.scaleMode = StageScaleMode.NO_SCALE
			stage.align = StageAlign.TOP
			//stage.align = StageAlign.TOP_LEFT
			
		}
		
		function handleClick(e:MouseEvent):void{
			trace(mouseX)
			trace(mouseY)
		}
		
		function handleStart(e:MouseEvent):void{
			bttnPlay.visible = true
			bttnPause.visible = true
			bttnSwitch.visible = true
			player.visible = true
			logo.visible = false
			text.visible = false
			text2.visible = false
			removeEventListener(MouseEvent.CLICK, handleStart)
		}
		
		function handlePlay(e:MouseEvent):void{
			player.play()
		}
		
		function handlePause(e:MouseEvent):void{
			player.pause()
		}
		
		function handleSwitch(e:MouseEvent):void{
			player.pause()
			eStop.seek(0)
			eStop.play()
			addChild(eStop)
			//gotoAndStop(2)
		}
		
		function handleTwo(e:MouseEvent):void{
			player.load("test.mp4")
			//b.visible = false
			backBttn.visible = true
			
		}
		
		function handleMain(e:MouseEvent):void{
			player.load("test3.mp4")
			//b.visible = true
			backBttn.visible = false
			
		}
		
		function endStop(e:fl.video.VideoEvent):void{
			trace("Stop")
			removeChild(eStop)
			gotoAndStop(1)
		}
	}
	
}
