package managers;

import pool.StarlingPool;
import core.Assets;
import objects.Bullet;
import states.Play;

class BulletManager
{
    
    public var bullets : Array<Bullet>;
	public var count : Int = 0;
    private var _pool : StarlingPool<Bullet>;
	private var _play : Play;
   
    
    public function new(play : Play)
    {
        this._play = play;
        bullets = new Array<Bullet>();
        _pool = new StarlingPool(Bullet, 100);
    }
    
    public function update(deltaTime:Float) : Void
    {
        var b : Bullet;
        var len : Int = bullets.length;
        
        var i : Int = len - 1;
        while (i >= 0)
        {
            b = bullets[i];
            b.y -= 50*deltaTime;
            if (b.y < 0)
            {
                destroyBullet(b);
            }
            i--;
        }
        
        if (_play.mouseControl.fire && count % 10 == 0)
        {
            fire();
        }
        
        count++;
    }
    
    private function fire() : Void
    {
        var b : Bullet = _pool.getObject();
        _play.addChild(b);
        b.x = _play.hero.x - 10;
        b.y = _play.hero.y - 15;
        bullets.push(b);
        
        b = _pool.getObject();
        _play.addChild(b);
        b.x = _play.hero.x + 10;
        b.y = _play.hero.y - 15;
        bullets.push(b);
        
        Assets.instance.manager.getSound("shoot").play();
    }
    
    public function destroyBullet(b : Bullet) : Void
    {
        var len : Int = bullets.length;
        
        for (i in 0...len)
        {
            if (bullets[i] == b)
            {
                bullets.splice(i, 1);
                b.removeFromParent(true);
                _pool.returnObject(b);
            }
        }
    }
    
    public function destroy() : Void
    {
        _pool.destroy();
        _pool = null;
        bullets = null;
    }
}
