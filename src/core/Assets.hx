package core;

import haxe.Constraints.Function;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.AssetManager;
import openfl.system.Capabilities;

class Assets {
	
	public static var instance(get, null):Assets;

	public var manager:AssetManager;

	private static function get_instance():Assets {
		if (instance == null) {
			instance = new Assets();
		}
		return instance;
	}

	public function new() {
		instance = this;
		manager = new AssetManager();

		loadResource();
	}

	public function onLoading(loading):Void {
		manager.loadQueue(loading);
	}

	function loadResource() {

		 //manager.verbose = Capabilities.isDebugger;

        manager.enqueue([
            openfl.Assets.getPath ("assets/komika.png"),
            openfl.Assets.getPath ("assets/komika.fnt"),
            openfl.Assets.getPath ("assets/atlas.png"),
            openfl.Assets.getPath ("assets/atlas.xml"),
            openfl.Assets.getPath ("assets/explosion.pex"),
			openfl.Assets.getPath ("assets/smoke.pex"),
			openfl.Assets.getPath ("assets/sky.png"),
            #if flash
            openfl.Assets.getPath ("assets/explosion.mp3"),
			openfl.Assets.getPath ("assets/shoot.mp3")
            #else
            openfl.Assets.getPath ("assets/explosion.ogg"),
			openfl.Assets.getPath ("assets/shoot.ogg")
            #end
        ]);
	}
}
