package com.gamehero.sxd2.gui.core.util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	/**
	 * 添加sp，<br>
	 * 为了节省代码量
	 * @author weiyanyu
	 * 创建时间：2016-4-8 下午3:13:52
	 * 
	 */
	public class SpAddUtil
	{
		public function SpAddUtil()
		{
		}
		/**
		 *  
		 * @param parent 父容器
		 * @param child 子容器
		 * @param px 坐标x
		 * @param py 坐标y
		 * 
		 */		
		public static function add(parent:DisplayObjectContainer,child:DisplayObject,px:int = 0, py:int = 0):void
		{
			parent.addChild(child);
			child.x = px;
			child.y = py;
		}
		/**
		 * 回收显示对象 
		 * @param value
		 * 
		 */		
		public static function gc(value:DisplayObject):void
		{
			if(value)
			{
				if(value.parent)
				{
					value.parent.removeChild(value);
				}
				value = null;
			}
		}
	}
}