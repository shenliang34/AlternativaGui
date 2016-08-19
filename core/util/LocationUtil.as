package com.gamehero.sxd2.gui.core.util
{
	import flash.display.DisplayObject;

	/**
	 * 组件位置的方法
	 * @author weiyanyu
	 * 创建时间：2015-12-12 下午4:01:27
	 * 
	 */
	public class LocationUtil
	{
		public function LocationUtil()
		{
		}
		/**
		 * 让curSp的横坐标相对于 父容器的centerX点对齐
		 * @param curSp
		 * @param relySp
		 * 
		 */		
		public static function autoCenterX(curSp:DisplayObject,centerX:int):void
		{
			curSp.x = centerX - (curSp.width >> 1);
		}
		
		/**
		 * 让curSp的横坐标相对于 父容器的centerY点对齐
		 * @param curSp
		 * @param relySp
		 * 
		 */		
		public static function autoCenterY(curSp:DisplayObject,centerY:int):void
		{
			curSp.y = centerY - (curSp.height >> 1);
		}
	}
}