package objects;

import core.Assets;
import starling.display.BlendMode;
import starling.display.Image;
import starling.display.Sprite;

class Background extends Sprite
{
    private var sky1 : Image;
    private var sky2 : Image;
    
    public function new()
    {
        super();
        sky1 = new Image(Assets.instance.manager.getTexture("sky"));
        sky1.blendMode = BlendMode.NONE;
        addChild(sky1);
        
        sky2 = new Image(Assets.instance.manager.getTexture("sky"));
        sky2.blendMode = BlendMode.NONE;
        sky2.y = -sky1.height;
        addChild(sky2);
		
		
		
    }
    
    public function update(deltaTime:Float) : Void
    {
       
		this.y += 5 * deltaTime;
		
		if (this.y >= 800){
			this.y = 0;
		}
    }
}
