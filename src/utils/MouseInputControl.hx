package utils;

import haxe.Constraints.Function;
import openfl.geom.Point;
import openfl.utils.Object;
import starling.core.Starling;
import starling.display.Stage;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

/**
 * ...
 * @author ...
 */
class MouseInputControl
{
	public var touchX:Float;
	public var touchY:Float;
	public var fire:Bool;
	private var stageRef:Stage;
	public var onTrouchDown:Function;
	public var onTouchUp:Function;

	
	
	public function new(onTouchUp:Function,onTrouchDown:Function) 
	{
		this.onTrouchDown = onTrouchDown;
		this.onTouchUp = onTouchUp;
		stageRef = Starling.current.stage;
		stageRef.addEventListener(TouchEvent.TOUCH, _onTouch);
		
		ready();
	}
	
	private function _onTouch(event:TouchEvent):Void
    {
		var touch:Touch = event.getTouch(stageRef, TouchPhase.HOVER);
        if (touch == null) touch = event.getTouch(stageRef, TouchPhase.BEGAN);
        if (touch == null) touch = event.getTouch(stageRef, TouchPhase.MOVED);

        if (touch != null)
        {
            var localPos:Point = touch.getLocation(stageRef);
            touchX  = localPos.x;
            touchY   = localPos.y;
        }
		
		if (event.getTouch(stageRef, TouchPhase.BEGAN) != null ){
			fire = true;
			onTrouchDown();
		}else if(event.getTouch(stageRef, TouchPhase.ENDED) != null ){
			fire = false;
			onTouchUp();
		}
    }
	
	/*private function onTouch(e:TouchEvent):void
        {
            var touch:Touch = e.getTouch(stage);
            if(touch)
            {
                if(touch.phase == TouchPhase.BEGAN)
                {
                              //There was a touch (MouseDown)
                }
 
                else if(touch.phase == TouchPhase.ENDED)
                {
                                //The Touch ended (MouseUp)
                }
 
                else if(touch.phase == TouchPhase.MOVED)
                {
                                //dragging
                }
            }
 
        }*/
	
	function ready():Void
	{
		
	}
	
	
	public function destroy():Void
	{
		stageRef.removeEventListener(TouchEvent.TOUCH, _onTouch);
	}
	
}