package objects;

import core.Assets;
import starling.display.MovieClip;

class Alien extends MovieClip
{
    public function new()
    {
		super(Assets.instance.manager.getTextures("alien"), 12);
        pivotX = width * 0.5;
        pivotY = height * 0.5;
    }
}
