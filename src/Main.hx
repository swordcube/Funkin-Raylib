class Main {
	public static var game:Game;

	static function main() {
		game = new Game("Friday Night Funkin'", 1280, 720, 240);
		Game.switchScene(new scenes.TitleScreen());
		game.start();
	}
}