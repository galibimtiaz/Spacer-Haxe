package states;

import core.Assets;
import core.Game;
import interfaces.IState;
import objects.Background;
import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.text.TextFormat;
import starling.utils.Align;

class GameOver extends Sprite implements IState
{
    private var _game : Game;
    private var _background : Background;
    private var _overText : TextField;
    private var _tryAgain : Button;
    
    public function new(game : Game)
    {
        super();
        this._game = game;
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    
    private function init(event : Event) : Void
    {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
        _background = new Background();
		_background.x = stage.stageWidth / 2 - _background.width / 2;
        addChild(_background);
		
		var _textFormate:TextFormat = new TextFormat("KomikaAxis", 72, 0xFFFFFF, Align.CENTER);
        
        _overText = new TextField(800, 200, "GAME OVER",_textFormate);
		_overText.x = stage.stageWidth / 2 - _overText.width / 2;
        _overText.y = 200;
        addChild(_overText);
        
        _tryAgain = new Button(Assets.instance.manager.getTexture("tryAgainButton"));
		_tryAgain.x = stage.stageWidth / 2;
        _tryAgain.addEventListener(Event.TRIGGERED, onAgain);
        _tryAgain.pivotX = _tryAgain.width * 0.5;
        _tryAgain.y = 450;
        addChild(_tryAgain);
    }
    
    private function onAgain(event : Event) : Void
    {
        _tryAgain.removeEventListener(Event.TRIGGERED, onAgain);
        _game.changeState(Game.PLAY_STATE);
    }
    
    public function update(deltaTime:Float) : Void
    {
        _background.update(deltaTime);
    }
    
    public function destroy() : Void
    {
        removeFromParent(true);
    }
	
	
	public function reSize() : Void
    {
        
    }
}
