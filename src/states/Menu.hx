package states;

import core.Assets;
import core.Game;
import interfaces.IState;
import objects.Background;
import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

class Menu extends Sprite implements IState {
    
	private var _game:Game;
	private var _background:Background;
	private var _logo:Image;
	private var _play:Button;

	public function new(game:Game) {
		super();
		this._game = game;
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);

		_background = new Background();
		_background.x = stage.stageWidth / 2 - _background.width / 2;
		addChild(_background);

		_logo = new Image(Assets.instance.manager.getTexture("logo"));
		_logo.pivotX = _logo.width * 0.5;
		_logo.x = stage.stageWidth / 2;
		_logo.y = 250;
		addChild(_logo);

		_play = new Button(Assets.instance.manager.getTexture("playButton"));
		_play.addEventListener(Event.TRIGGERED, onPlay);
		_play.pivotX = _play.width * 0.5;
		_play.x = stage.stageWidth / 2;
		_play.y = 450;
		addChild(_play);
	}

	private function onPlay(event:Event):Void {
		_game.changeState(Game.PLAY_STATE);
	}

	public function update(deltaTime:Float):Void {
		_background.update(deltaTime);
	}

	public function destroy():Void {
		_background.removeFromParent(true);
		_background = null;
		_logo.removeFromParent(true);
		_logo = null;
		_play.removeFromParent(true);
		_play = null;
		removeFromParent(true);
	}

	public function reSize():Void {}
}
