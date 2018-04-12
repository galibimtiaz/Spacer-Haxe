package managers;

import objects.Alien;
import pool.StarlingPool;
import starling.core.Starling;
import states.Play;
import utils.Utils;

class AlienManager
{
    
    public var aliens : Array<Alien>;
	public var count : Int = 0;
    private var _pool : StarlingPool<Alien>;
	private var _play : Play;
    
    
    public function new(play : Play)
    {
        this._play = play;
        aliens = new Array();
        _pool = new StarlingPool(Alien, 16);
    }
    
    public function update(deltaTime:Float) : Void
    {
        if (Math.random() < 0.05)
        {
            spawn();
        }
        
        var a : Alien;
        var len : Int = aliens.length;
        
        var i : Int = len - 1;
        while (i >= 0)
        {
            a = aliens[i];
            a.y += 40	*deltaTime;
            if (a.y > 800)
            {
                destroyAlien(a);
            }
            i--;
        }
    }
    
    private function spawn() : Void
    {
        var a : Alien = _pool.getObject();
        Starling.current.juggler.add(a);
        aliens.push(a);
        a.y = -50;
        a.x = Utils.randomRange(_play.background.x,_play.background.x + _play.background.width);
        _play.addChild(a);
    }
    
    public function destroyAlien(a : Alien) : Void
    {
        var len : Int = aliens.length;
        
        for (i in 0...len)
        {
            if (a == aliens[i])
            {
                aliens.splice(i, 1);
                Starling.current.juggler.remove(a);
                a.removeFromParent(true);
                _pool.returnObject(a);
            }
        }
    }
    
    public function destroy() : Void
    {
        _pool.destroy();
        _pool = null;
        aliens = null;
    }
}
