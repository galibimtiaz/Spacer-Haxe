package pool;

/**
 * ...
 * @author ...
 */
import openfl.errors.Error;

class StarlingPool<T>
{
	public var items:Array<T>;
	private var _counter:Int;

	public function new(type:Class<T>, len:Int)
	{
		items = new Array();
		_counter = len;

		var i:Int = len;
		while (--i > -1)
			items[i] = Type.createInstance(type,[]);
	}

	public function getObject():T
	{
		if (_counter > 0)
			return items[--_counter];
		else
			throw new Error("You exhausted the pool!");
			return null;
	}

	public function returnObject(s:T):Void
	{
		items[_counter++] = s;
	}

	public function destroy():Void
	{
		items = null;
	}
}