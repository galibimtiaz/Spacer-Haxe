package objects;

import core.Assets;
import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.extensions.PDParticleSystem;
import states.Play;

class Hero extends Sprite
{
    private var _play : Play;
    private var _smoke : PDParticleSystem;
    
    public function new(play : Play)
    {
        super();
        this._play = play;
        
        var img : Image = new Image(Assets.instance.manager.getTexture("hero"));
        img.pivotX = img.width * 0.5;
        img.pivotY = img.height * 0.5;
        addChild(img);
        
        _smoke = new PDParticleSystem(openfl.Assets.getText("assets/smoke.pex"), Assets.instance.manager.getTexture("smoke"));
				
        Starling.current.juggler.add(_smoke);
        play.addChild(_smoke);
        _smoke.start();
    }
    
    public function update(deltaTime:Float) : Void
    {
        _smoke.emitterX = x;
        _smoke.emitterY = y + 20;
        x += (_play.mouseControl.touchX - x) * 0.3;
        y += (_play.mouseControl.touchY - y) * 0.3;
    }
}
