package interfaces;

interface IState {
	function update(deltaTime:Float):Void;
	function destroy():Void;
	function reSize():Void;
}
