package engine.tweens.misc;

import engine.tweens.Tween;

#if !macro
import engine.Sprite;
#end

/**
 * Tweens from one angle to another.
 */
class AngleTween extends Tween {
	public var angle(default, null):Float;

	/**
	 * Optional sprite object whose angle to tween
	 */
	public var sprite(default, null):#if !macro Sprite #else Dynamic #end;

	var _start:Float;
	var _range:Float;

	/**
	 * Clean up references
	 */
	override public function destroy() {
		super.destroy();
		sprite = null;
	}

	/**
	 * Tweens the value from one angle to another.
	 *
	 * @param	FromAngle		Start angle.
	 * @param	ToAngle			End angle.
	 * @param	Duration		Duration of the tween.
	 */
	public function tween(FromAngle:Float, ToAngle:Float, Duration:Float, ?Sprite:#if !macro Sprite #else Dynamic #end):AngleTween {
		_start = angle = FromAngle;
		_range = ToAngle - angle;
		duration = Duration;
		sprite = Sprite;
		if (sprite != null) {
			sprite.angle = angle % 360;
		}
		start();
		return this;
	}

	override function update(elapsed:Float):Void {
		super.update(elapsed);
		angle = _start + _range * scale;

		if (sprite != null) {
			var spriteAngle:Float = angle % 360;
			sprite.angle = spriteAngle;
		}
	}

	override function isTweenOf(object:Dynamic, ?field:String):Bool {
		return sprite == object && (field == null || field == "angle");
	}
}
