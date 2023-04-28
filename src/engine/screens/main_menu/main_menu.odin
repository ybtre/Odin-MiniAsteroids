package screen_main_menu

import "core:fmt"

import rl "vendor:raylib"
import "../../../globals"
import "../../../entities/cursor"
import "../../../entities/background"
import "../../game_overlord"

update :: proc() {
    cursor.update()

    if rl.IsKeyPressed(rl.KeyboardKey.SPACE)
    {
        game_overlord.set_current_screen(game_overlord.SCREENS.GAMEPLAY)
    }
}

render :: proc(){
    using rl
    using globals

    background.render()

    DrawText("ASTEOIDS", i32(SCREEN.x / 2 - 175), i32(SCREEN.y / 2 - 60), 60, C_TEXT)
    DrawText("PRESS SPACE TO PLAY", i32(SCREEN.x / 2 - 250), i32(SCREEN.y / 2), 40, C_TEXT)

    cursor.render()
}