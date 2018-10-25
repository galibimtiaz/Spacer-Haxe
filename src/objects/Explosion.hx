package objects;

import core.Assets;
import starling.extensions.PDParticleSystem;

class Explosion extends PDParticleSystem {
	public function new() {
		super(Assets.instance.manager.getXml("explosion").toString(), Assets.instance.manager.getTexture("explosion"));
	}
}
