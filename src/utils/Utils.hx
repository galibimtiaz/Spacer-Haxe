package utils;

/**
 * ...
 * @author Galib Imtiaz
 */
class Utils {

	public static function randomRange(minNum:Float, maxNum:Float):Float {
		return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	}
	
}
