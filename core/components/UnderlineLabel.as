package com.gamehero.sxd2.gui.core.components
{
	import com.gamehero.sxd2.data.GameDictionary;
	import com.gamehero.sxd2.gui.theme.ifstheme.controls.text.Label;
	import com.gamehero.sxd2.local.Lang;
	
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import alternativa.gui.base.ActiveObject;

	/**
	 * @author weiyanyu
	 * 创建时间：2015-11-15 下午4:07:04
	 * 
	 */
	public class UnderlineLabel extends ActiveObject
	{
		private var _color:int = 0;
		private var _enable:Boolean = false;
		private var _text:String = "";
		private var _textField:TextField;
		private var _activeObject:Shape;
		
		public function UnderlineLabel()
		{
			mouseChildren = false;
			
			_textField = new TextField();
			_textField.height = 20;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.filters = [Label.TEXT_FILTER];
			_textField.selectable = false;
			addChild(_textField);
			
			var tf:TextFormat = new TextFormat();
			tf.size = 12;
			tf.font = GameDictionary.FONT_NAME;
			_textField.defaultTextFormat = tf;
			
			_activeObject = new Shape();
			addChild(_activeObject);
			
			color = GameDictionary.TASK_GREEN;//default color
			enable = true;//default
		}
		
		public function get color():int {
			return _color;
		}
		
		public function set color(value:int):void {
			if (_color != value) {
				_color = value;
				updateUI();
			}
		}
		
		public function get text():String {
			return _text;
		}
		
		public function set text(value:String):void {
			if (_text != value) {
				_text = value;
				updateUI();
			}
		}
		
		public function get enable():Boolean{
			return _enable;
		}
		
		public function set enable(value:Boolean):void{
			if(_enable != value){
				_enable = value;
				mouseEnabled = value;
			}
		}
		
		private function updateUI():void{
			if(text != ""){
				_textField.htmlText = "<font size='12' face='宋体' color='#" + color.toString(16) + "'>" + "<u>" +  Lang.instance.trans(text) + "</u>" + "</font>";
				_activeObject.graphics.clear();
				_activeObject.graphics.beginFill(0x777777, 0);
				_activeObject.graphics.drawRect(0, 0, _textField.width, _textField.height);
			}
		}
		
	}
}