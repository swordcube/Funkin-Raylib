package engine.sound;

#if !macro
class SoundManager {
    public var music:Audio;

    public var volume(default, set):Float = 1;
    private function set_volume(v:Float) {
        Rl.setMasterVolume(v);
        return volume = v;
    }

    public var muted(default, set):Bool = false;
    private function set_muted(v:Bool) {
        Rl.setMasterVolume((v) ? 0 : volume);
        return muted = v;
    }
    
    public var list:Array<Audio> = [];
    
    public function new() {
        Game.signals.preSceneCreate.add(() -> {
            trace("[ENGINE] Clearing sounds...");
            for(sound in list) {
                sound.kill();
                sound.stop();
                sound.destroy();
            }
            list = [];
        });

        Game.signals.preSceneUpdate.add(update);
    }

    public function update(elapsed:Float) {
        for(sound in list)
            sound.update(elapsed);

        music.update(elapsed);
    }

    public function play(path:String, ?volume:Float) {
        list.push(new Audio(path, volume).play());
    }

    public function playMusic(path:String, ?volume:Float, ?loop:Bool = true) {
		if (music != null)
			music.destroy();

		music = new Audio(path, volume).play();
        music.loop = loop;
	}
}
#end