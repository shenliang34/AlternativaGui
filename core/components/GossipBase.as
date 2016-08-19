package com.gamehero.sxd2.gui.core.components
{
	import com.gamehero.sxd2.gui.core.util.SpAddUtil;
	import com.gamehero.sxd2.gui.theme.ifstheme.controls.text.Label;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import bowser.utils.effect.TextEf;
	
	
	/**
	 * 用于剧情显示人物对话
	 * @author weiyanyu
	 * 创建时间：2016-6-30 下午2:25:30
	 **/
	public class GossipBase extends Sprite
	{
		// 闲话泡泡
		protected var _bubbleItem:DisplayObject;
		protected var textItem:TextEf;
		protected var lb:Label;
		protected var message:String;
		
		protected var showTimerID:int;
		protected var hideTimerID:int;
		protected var callback:Function;
		
		/**
		 * 构造函数
		 * */
		public function GossipBase()
		{
			super();
			// 对话内容
			lb = new Label(false);
			lb.y = 18;
			lb.width = 130;
			lb.height = 60;
			lb.leading = 0.4;
			lb.color = 0x000000;
			textItem = new TextEf();
			this.addChild(textItem);
		}
		
		public function set bubbleItem(value:DisplayObject):void
		{
			SpAddUtil.gc(_bubbleItem);
			_bubbleItem = value;
			addChildAt(_bubbleItem,0);
		}
		public function get bubbleItem():DisplayObject
		{
			return _bubbleItem;
		}
		/**
		 * 显示闲话
		 * @param dialog
		 * @param duration 显示冒泡时间（毫秒）
		 */
		public function showGossip(dialog:String , duration:int = 0 , direct:int = 1 , callback:Function = null):void 
		{	
			this.callback = callback;
			showDialog(dialog);
			// 若存在duration,一定时间后关闭
			if(duration > 0)
			{
				hideTimerID = setTimeout(hide , duration);
			}
			this.updatePosition(direct);
		}
		
		public function showDialog(dialog:String):void
		{
			this.message = dialog;
			// 立即显示文字
			showText();
		}
		
		/**
		 * 显示文字
		 * */
		private function showText():void
		{
			textItem.show(lb , message);
			// html文本
			if(message.indexOf("|") >= 0)
			{
				textItem.showFull();
			}
		}
		/**
		 * 显示全部文字
		 * */
		public function showFullText():void
		{
			if(textItem.isStart == false)
			{
				textItem.show(lb , message);
			}
			textItem.showFull();
			
			if(showTimerID > 0)
			{
				clearTimeout(showTimerID);
				showTimerID = 0;
			}
		}
		
		/**
		 * 隐藏闲话
		 */
		public function hide():void 
		{	
			if(callback)
			{
				var tempfunc:Function = callback;
				callback = null;
				tempfunc(this);
			}
			
			this.clear();
		}
		/**
		 * 更新闲话泡泡位置
		 */
		protected function updatePosition(direct:int):void
		{	
			// 正向
			if(direct == 1)
			{
				textItem.x = 35;
				bubbleItem.scaleX = 1;
			}
			else
			{
				textItem.x = -200;
				bubbleItem.scaleX = -1;
			}
		}
		
		public function get isEnd():Boolean
		{
			return textItem.isEnd;
		}
		/**
		 * 清空
		 */
		public function clear():void
		{
			callback = null;
			
			if(hideTimerID > 0)
			{
				clearTimeout(hideTimerID);
				hideTimerID = 0;
			}
			if(showTimerID > 0)
			{
				clearTimeout(showTimerID);
				showTimerID = 0;
			}
		}
		
	}
}

