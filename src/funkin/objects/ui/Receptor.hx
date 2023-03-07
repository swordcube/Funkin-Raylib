package funkin.objects.ui;

class Receptor extends Sprite {
    public var keyCount:Int = 4;
    public var noteData:Int = 0;

    public function new(?x:Float = 0, ?y:Float = 0, ?keyCount:Int = 0, ?noteData:Int = 0) {
        super(x, y);
        this.keyCount = keyCount;
        this.noteData = noteData;

        var directionData = Note.directionData.get(keyCount);

        frames = Paths.getSparrowAtlas("gameplay/notes/default/assets");
        animation.addByPrefix("static", directionData.directions[noteData]+" static0", 24);
        animation.addByPrefix("pressed", directionData.directions[noteData]+" pressed0", 24, false);
        animation.addByPrefix("confirm", directionData.directions[noteData]+" confirm0", 24, false);
        animation.play("static");

        scale.set(0.7 * directionData.scaleMult, 0.7 * directionData.scaleMult);
        updateHitbox();
    }
}