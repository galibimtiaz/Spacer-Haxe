package objects;

import starling.display.Sprite;
import starling.text.TextField;

class Score extends Sprite
{
    private var _score : TextField;
    
    public function new()
    {
        super();
        _score = new TextField(300, 100, "0", "KomikaAxis", 32, 0xFFFFFF);
        _score.hAlign = "right";
        addChild(_score);
    }
    
    public function addScore(amt : Float) : Void
    {
		_score.text = (Std.parseInt(_score.text)+amt)+"";
    }
}
