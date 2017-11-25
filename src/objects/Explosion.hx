package objects;

import core.Assets;
import starling.extensions.PDParticleSystem;
import starling.textures.Texture;

class Explosion extends PDParticleSystem
{
    public function new()
    {
        super(openfl.Assets.getText("assets/explosion.pex"),Assets.instance.manager.getTexture("explosion"));
    }
}
