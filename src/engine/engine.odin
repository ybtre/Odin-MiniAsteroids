package engine

import rl "vendor:raylib"
import "../entities"
import "../entities/cursor"
import "../entities/background"
import "../entities/game_map"
import "game_overlord"
import "screens/game_over"
import "screens/gameplay"
import "screens/main_menu"
import "screens/upgrade"

game_atlas : rl.Texture2D
bg_tex : rl.Texture2D

initialize :: proc(){
    game_atlas = rl.LoadTexture("../assets/game_atlas_8x8.png")
    bg_tex = rl.LoadTexture("../assets/background.png")

    game_overlord.startup()
    game_overlord.setup_game()

    game_map.setup(&game_atlas)
    background.setup(&bg_tex)
    cursor.setup(&game_atlas)
}

update :: proc(){
    switch game_overlord.get_current_screen() {
        case game_overlord.SCREENS.MAIN_MENU:
            main_menu.update()
            break;
        case game_overlord.SCREENS.GAMEPLAY:
            gameplay.update()
            break;
        case game_overlord.SCREENS.GAME_OVER:
            break;
        case game_overlord.SCREENS.UPGRADE:
            break;
    }
    cursor.update()
}

render :: proc(){
    rl.BeginDrawing()
    rl.ClearBackground(rl.BLACK)

    {// RENDER
        switch game_overlord.get_current_screen() {
            case game_overlord.SCREENS.MAIN_MENU:
                main_menu.render()
                break;
            case game_overlord.SCREENS.GAMEPLAY:
                gameplay.render()
                break;
            case game_overlord.SCREENS.GAME_OVER:
                break;
            case game_overlord.SCREENS.UPGRADE:
                break;
        }
        // background.render()
        // game_map.render(game_atlas)
        // cursor.render()
    }
    rl.DrawFPS(0, 0)

    rl.EndDrawing()
}

shutdown :: proc(){
    rl.UnloadTexture(game_atlas)
}