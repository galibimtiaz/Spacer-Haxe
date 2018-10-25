package managers;

import core.Assets;
import objects.Explosion;
import pool.StarlingPool;
import starling.core.Starling;
import starling.events.Event;
import states.Play;

class ExplosionManager {
    
	private var _play:Play;
	private var _pool:StarlingPool<Explosion>;

	public function new(play:Play) {
		this._play = play;
		_pool = new StarlingPool(Explosion, 10);
	}

	public function spawn(x:Int, y:Int):Void {
		var ex:Explosion = _pool.getObject();
		ex.emitterX = x;
		ex.emitterY = y;
		ex.start(0.1);
		_play.addChild(ex);
		Starling.current.juggler.add(ex);

		Assets.instance.manager.getSound("explosion").play();

		ex.addEventListener(Event.COMPLETE, onComplete);
	}

	private function onComplete(event:Event):Void {
		var ex:Explosion = try cast(event.currentTarget, Explosion) catch (e:Dynamic) null;
		Starling.current.juggler.remove(ex);
		_play.removeChild(ex);

		if (_pool != null) {
			_pool.returnObject(ex);
		}
	}

	public function destroy():Void {
		for (i in 0..._pool.items.length) {
			var ex:Explosion = _pool.items[i];
			ex.dispose();
			ex = null;
		}
		_pool.destroy();
		_pool = null;
	}
}
