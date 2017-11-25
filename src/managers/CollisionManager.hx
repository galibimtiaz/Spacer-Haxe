package managers;

import core.Assets;
import core.Game;
import flash.geom.Point;
import haxe.Timer;
import objects.Alien;
import objects.Bullet;
import states.Play;

class CollisionManager
{
    private var _play : Play;
    private var _p1 : Point = new Point();
    private var _p2 : Point = new Point();
    private var _count : Int = 0;
    
    public function new(play : Play)
    {
        this._play = play;
    }
    
    public function update(deltaTime:Float) : Void
    {
        if ((_count & 1) != 0)
        {
            bulletsAndAliens();
        }
        else
        {
            heroAndAliens();
        }
        
        _count++;
    }
    
    private function heroAndAliens() : Void
    {
        var aa : Array<Alien> = _play.alienManager.aliens;
        var a : Alien;
        
        var i : Int = aa.length - 1;
        while (i >= 0)
        {
            a = aa[i];
            _p1.x = _play.hero.x;
            _p1.y = _play.hero.y;
            _p2.x = a.x;
            _p2.y = a.y;
            if (Point.distance(_p1, _p2) < a.pivotY + _play.hero.pivotY)
            {
                _play._game.changeState(Game.GAME_OVER_STATE);
            }
            i--;
        }
    }
    
    private function bulletsAndAliens() : Void
    {
        var ba : Array<Bullet> = _play.bulletManager.bullets;
        var aa : Array<Alien> = _play.alienManager.aliens;
        
        var b : Bullet;
        var a : Alien;
        
        var i : Int = ba.length - 1;
        while (i >= 0)
        {
            b = ba[i];
            var j : Int = aa.length - 1;
            while (j >= 0)
            {
                a = aa[j];
                _p1.x = b.x;
                _p1.y = b.y;
                _p2.x = a.x;
                _p2.y = a.y;
                if (Point.distance(_p1, _p2) < a.pivotY + b.pivotY)
                {
                     
                    _play.explosionManager.spawn(Math.round(a.x), Math.round(a.y));
					//Timer.
                    _play.alienManager.destroyAlien(a);
                    _play.bulletManager.destroyBullet(b);
                    _play.score.addScore(200);
                }
                j--;
            }
            i--;
        }
    }
}
