package com.gamehero.sxd2.gui.core.money
{
	import com.gamehero.sxd2.data.GameDictionary;
	import com.gamehero.sxd2.gui.bag.events.BagEvent;
	import com.gamehero.sxd2.gui.bag.model.BagModel;
	import com.gamehero.sxd2.gui.theme.ifstheme.controls.text.Label;
	import com.gamehero.sxd2.pro.MSGID;
	import com.gamehero.sxd2.services.GameService;
	
	import flash.events.Event;
	
	
	/**
	 * 格式
	 * 例：  铜钱：100  ，灵石：100
	 * @author weiyanyu
	 * 创建时间：2016-4-8 上午11:31:29
	 * 
	 */
	public class MoneyTextLabel extends MoneyBaseLabel
	{
		public function MoneyTextLabel()
		{
			super();
			_label = new Label();
			addChild(_label);
			this.mouseChildren = false;
		}
		/**
		 * 显示的文本 
		 */		
		protected var _label:Label;
		/**
		 * 物品id 
		 */		
		protected var _itemId:int;
		/**
		 * 需要消耗的数量 
		 */		
		private var _needNum:int;
		/**
		 * 设置物品id 
		 * @param value
		 * 
		 */		
		override public function set iconId(value:int):void
		{
			super.iconId = value;
			_itemId = value;
			resize();
		}
		
		protected function resize():void
		{
			this.width = _label.width;
		}
		
		/**
		 *  需要实时更新物品数量
		 * @param num 基础值，如果低于这个值 显示红色，大于或等于这个值显示绿色
		 * @fun 当物品数量变化后需要回调的函数
		 */		
		public function needFresh(num:int = 0,fun:Function = null):void
		{
			callBack = fun;
			_needNum = num;
			setAutoColor();
				GameService.instance.addEventListener(MSGID.MSGID_UPDATE_PLAYER.toString(),updataPlayerHandle);
				BagModel.inst.addEventListener(BagEvent.ITEM_UPDATA,updataPlayerHandle);
		}
		
		override protected function updataPlayerHandle(event:Event):void
		{
			super.updataPlayerHandle(event);
			setAutoColor();
		}
		
		protected function setAutoColor():void
		{
			if(_needNum > BagModel.inst.getNumByItemId(_itemId))
			{
				_label.color = GameDictionary.RED;
			}
			else
			{
				_label.color = GameDictionary.WHITE;
			}
		}
		
		override public function set text(value:String):void
		{
			super.text = value;
			_label.text = value;
			resize();
		}
		/**
		 *  根据文本的坐标y设置新坐标；<br>
		 *  正常情况下坐标设置是根据 icon图标的。<br>
		 * 
		 */		
		public function setyByLabel(value:int):void
		{
			resize();
			this.y = value - _label.y;
		}
		/**
		 * 获取label，方便给lb设置属性 <br>
		 * 注意   不要直接设置文本，否则坐标会有问题
		 * @return 
		 * 
		 */		
		public function get lb():Label
		{
			return _label;
		}
		
		protected function onComplet(event:Event):void
		{
			resize();
		}
		
	}
}