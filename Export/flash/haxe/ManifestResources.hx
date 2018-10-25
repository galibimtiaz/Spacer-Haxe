package;


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
	
	
	public static function init (config:Dynamic):Void {
		
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
		
		#if kha
		
		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);
		
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");
		
		#else
		
		data = '{"name":null,"assets":"aoy4:sizei83805y4:typey5:IMAGEy9:classNamey25:__ASSET__assets_atlas_pngy2:idy18:assets%2Fatlas.pnggoR0i1291R1y4:TEXTR3y25:__ASSET__assets_atlas_xmlR5y18:assets%2Fatlas.xmlgoR0i17141R1y5:MUSICR3y29:__ASSET__assets_explosion_mp3R5y22:assets%2Fexplosion.mp3goR0i1989R1R7R3y29:__ASSET__assets_explosion_pexR5y22:assets%2Fexplosion.pexgoR0i6707R1R7R3y26:__ASSET__assets_komika_fntR5y19:assets%2Fkomika.fntgoR0i156716R1R2R3y26:__ASSET__assets_komika_pngR5y19:assets%2Fkomika.pnggoR0i9218R1R10R3y25:__ASSET__assets_shoot_mp3R5y18:assets%2Fshoot.mp3goR0i386655R1R2R3y23:__ASSET__assets_sky_pngR5y16:assets%2Fsky.pnggoR0i1992R1R7R3y25:__ASSET__assets_smoke_pexR5y18:assets%2Fsmoke.pexgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
		#end
		
	}
	
	
}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_atlas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_atlas_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_explosion_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_explosion_pex extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_komika_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_komika_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_shoot_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_smoke_pex extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:image("Assets/atlas.png") #if display private #end class __ASSET__assets_atlas_png extends lime.graphics.Image {}
@:keep @:file("Assets/atlas.xml") #if display private #end class __ASSET__assets_atlas_xml extends haxe.io.Bytes {}
@:keep @:file("Assets/explosion.mp3") #if display private #end class __ASSET__assets_explosion_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/explosion.pex") #if display private #end class __ASSET__assets_explosion_pex extends haxe.io.Bytes {}
@:keep @:file("Assets/komika.fnt") #if display private #end class __ASSET__assets_komika_fnt extends haxe.io.Bytes {}
@:keep @:image("Assets/komika.png") #if display private #end class __ASSET__assets_komika_png extends lime.graphics.Image {}
@:keep @:file("Assets/shoot.mp3") #if display private #end class __ASSET__assets_shoot_mp3 extends haxe.io.Bytes {}
@:keep @:image("Assets/sky.png") #if display private #end class __ASSET__assets_sky_png extends lime.graphics.Image {}
@:keep @:file("Assets/smoke.pex") #if display private #end class __ASSET__assets_smoke_pex extends haxe.io.Bytes {}
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end