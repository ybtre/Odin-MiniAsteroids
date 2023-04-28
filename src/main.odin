package game

import fmt "core:fmt"
import la "core:math/linalg"
import "core:strconv"
import rl "vendor:raylib"
import "core:strings"

import "globals"
import "engine"

main :: proc() {

	rl.SetRandomSeed(42)
	
	setup_window()
	rl.InitWindow(i32(globals.SCREEN.x), i32(globals.SCREEN.y), strings.clone_to_cstring(globals.project_name))

	engine.initialize()

	is_running: bool = true;
	for is_running && !rl.WindowShouldClose()
	{
		{// UPDATE
			engine.update()			
		}

		{// RENDER
			engine.render()
		}
	}

	engine.shutdown()

	rl.CloseWindow()
}

setup_window :: proc(){
	rl.SetTargetFPS(60)

	icon: rl.Image = rl.LoadImage("../assets/icons/window_icon.png")

	rl.ImageFormat(&icon, rl.PixelFormat.UNCOMPRESSED_R8G8B8A8)

	rl.SetWindowIcon(icon)

	rl.UnloadImage(icon)
}
