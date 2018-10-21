package core;

import haxe.Constraints.Function;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.AssetManager;

class Assets
{

	public static var instance(get, null):Assets;
	public var manager:AssetManager;
	
    private static function get_instance():Assets {
        if(instance == null) {
            instance = new Assets();
        }
        return instance;
    }

	public function new() 
	{
		instance = this;
		manager = new AssetManager();
		
		loadResource();
		
	}
	
	public function onLoading(loading:Function): Void {
		
		manager.loadQueue(loading());
	}
	
	
	function loadResource(){
		
		var assetsOI:openfl.Assets;
		
		var atlasTexture:Texture = Texture.fromBitmapData(openfl.Assets.getBitmapData("assets/atlas.png"), false);
        var atlasXml:Xml = Xml.parse(openfl.Assets.getText("assets/atlas.xml")).firstElement();
		manager.addTexture("atlas", atlasTexture);
        manager.addTextureAtlas("atlas", new TextureAtlas(atlasTexture, atlasXml));
		
		manager.addTexture("sky", Texture.fromBitmapData(openfl.Assets.getBitmapData("assets/sky.png"), false));
		
		var desyrelTexture:Texture = Texture.fromBitmapData(openfl.Assets.getBitmapData("assets/komika.png"), false);
        var desyrelXml:Xml = Xml.parse(openfl.Assets.getText("assets/komika.fnt")).firstElement();
        var bitmapFont = new BitmapFont(desyrelTexture, desyrelXml);
		
        TextField.registerBitmapFont(bitmapFont, bitmapFont.name);
        
		manager.addSound("explosion", openfl.Assets.getSound("assets/explosion.mp3"));
		manager.addSound("shoot", openfl.Assets.getSound("assets/shoot.mp3"));
        
		
        }
	
	
	
		

}