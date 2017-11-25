package objects;

import core.Assets;
import starling.display.Image;
import starling.display.Sprite;

class Bullet extends Sprite
{
	
	private var _bulletType:Int;

    public function new()
    {
        super();
        var img : Image = new Image(Assets.instance.manager.getTexture("bullet"));
        pivotX = width * 0.5;
        pivotY = height * 0.5;
        addChild(img);
    }
}
