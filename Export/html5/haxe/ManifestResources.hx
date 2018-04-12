package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy18:assets%2Fatlas.pngy4:sizei83805y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y18:assets%2Fatlas.xmlR2i1271R3y4:TEXTR5R7R6tgoR2i17141R3y5:MUSICR5y22:assets%2Fexplosion.mp3y9:pathGroupaR10hR6tgoR0y22:assets%2Fexplosion.pexR2i1989R3R8R5R12R6tgoR0y19:assets%2Fkomika.fntR2i6650R3R8R5R13R6tgoR0y19:assets%2Fkomika.pngR2i156716R3R4R5R14R6tgoR2i9218R3R9R5y18:assets%2Fshoot.mp3R11aR15hR6tgoR0y16:assets%2Fsky.pngR2i386655R3R4R5R16R6tgoR0y18:assets%2Fsmoke.pexR2i1992R3R8R5R17R6tgh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_atlas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_atlas_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_explosion_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_explosion_pex extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_komika_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_komika_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_shoot_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_smoke_pex extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("Assets/atlas.png") #if display private #end class __ASSET__assets_atlas_png extends lime.graphics.Image {}
@:file("Assets/atlas.xml") #if display private #end class __ASSET__assets_atlas_xml extends haxe.io.Bytes {}
@:file("Assets/explosion.mp3") #if display private #end class __ASSET__assets_explosion_mp3 extends haxe.io.Bytes {}
@:file("Assets/explosion.pex") #if display private #end class __ASSET__assets_explosion_pex extends haxe.io.Bytes {}
@:file("Assets/komika.fnt") #if display private #end class __ASSET__assets_komika_fnt extends haxe.io.Bytes {}
@:image("Assets/komika.png") #if display private #end class __ASSET__assets_komika_png extends lime.graphics.Image {}
@:file("Assets/shoot.mp3") #if display private #end class __ASSET__assets_shoot_mp3 extends haxe.io.Bytes {}
@:image("Assets/sky.png") #if display private #end class __ASSET__assets_sky_png extends lime.graphics.Image {}
@:file("Assets/smoke.pex") #if display private #end class __ASSET__assets_smoke_pex extends haxe.io.Bytes {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end