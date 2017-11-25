package core;

import interfaces.IState;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;
import states.GameOver;
import states.Menu;
import states.Play;

class Game extends Sprite
{
    public static inline var MENU_STATE : Int = 0;
    public static inline var PLAY_STATE : Int = 1;
    public static inline var GAME_OVER_STATE : Int = 2;
    
    private var _current_state : IState;
    
    public function new()
    {
        super();
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    
    private function init(event : Event) : Void
    {
        changeState(MENU_STATE);
        addEventListener(Event.ENTER_FRAME, update);
		addEventListener(Event.RESIZE, resize);
    }
	
	
    
    public function changeState(state : Int) : Void
    {
        if (_current_state != null)
        {
            _current_state.destroy();
            _current_state = null;
        }
        
        switch (state)
        {
            case MENU_STATE:
                _current_state = new Menu(this);
            
            case PLAY_STATE:
                _current_state = new Play(this);
            
            case GAME_OVER_STATE:
                _current_state = new GameOver(this);
        }
        
        addChild(cast((_current_state), Sprite));
    }
    
    private function update(event : EnterFrameEvent) : Void
    {
        _current_state.update(event.passedTime*10);
    }
	
	private function resize(e:Event):Void 
	{
		_current_state.reSize();
	}
}
