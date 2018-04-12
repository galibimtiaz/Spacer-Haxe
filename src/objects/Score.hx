package objects;

import starling.display.Sprite;
import starling.text.TextField;
import starling.text.TextFormat;
import starling.utils.Align;

class Score extends Sprite
{
    private var _score : TextField;
    
    public function new()
    {
        super();
		var _textFormate:TextFormat = new TextFormat("KomikaAxis", 32, 0xFFFFFF, Align.RIGHT);
		
        _score = new TextField(300, 100, "0",_textFormate);
        addChild(_score);
    }
    
    public function addScore(amt : Float) : Void
    {
		_score.text = (Std.parseInt(_score.text)+amt)+"";
    }
}
