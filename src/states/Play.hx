package states;

import core.Game;
import flash.events.MouseEvent;
import interfaces.IState;
import managers.AlienManager;
import managers.BulletManager;
import managers.CollisionManager;
import managers.ExplosionManager;
import objects.Background;
import objects.Hero;
import objects.Score;
import starling.display.Sprite;
import starling.events.Event;
import utils.MouseInputControl;

class Play extends Sprite implements IState
{
    public var game : Game;
    public var background : Background;
    public var hero : Hero;
    public var bulletManager : BulletManager;
    public var alienManager : AlienManager;
    private var _collisionManager : CollisionManager;
    public var explosionManager : ExplosionManager;
    public var score : Score;
	
	public var mouseControl:MouseInputControl;
    
    public function new(game : Game)
    {
        super();
        this.game = game;
        touchable = false;
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    
    private function init(event : Event) : Void
    {
		
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
        background = new Background();
		background.x = stage.stageWidth / 2 - background.width / 2;
        addChild(background);
        
        hero = new Hero(this);
		hero.x = stage.stageWidth / 2;
        addChild(hero);
        
        score = new Score();
        addChild(score);
        score.x = 450;
        
        bulletManager = new BulletManager(this);
        alienManager = new AlienManager(this);
        _collisionManager = new CollisionManager(this);
        explosionManager = new ExplosionManager(this);
        
        mouseControl = new MouseInputControl(onUp, onDown);
    }
    
    private function onDown(event : MouseEvent) : Void
    {
        
    }
    
    private function onUp(event : MouseEvent) : Void
    {
       
        bulletManager.count = 0;
    }
    
    public function update(deltaTime:Float) : Void
    {
        background.update(deltaTime);
        hero.update(deltaTime);
        bulletManager.update(deltaTime);
        alienManager.update(deltaTime);
        _collisionManager.update(deltaTime);
    }
    
    public function destroy() : Void
    {
        mouseControl.destroy();
        bulletManager.destroy();
        alienManager.destroy();
        removeFromParent(true);
    }
	
	
	
	public function reSize() : Void
    {
		
		
    }
}
