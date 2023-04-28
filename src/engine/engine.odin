package engine

import rl "vendor:raylib"
import entities "../entities"
import "../entities/cursor"
import "../entities/background"
import "../entities/game_map"

game_atlas : rl.Texture2D
bg_tex : rl.Texture2D

initialize :: proc(){
    game_atlas = rl.LoadTexture("../assets/game_atlas_8x8.png")
    bg_tex = rl.LoadTexture("../assets/background.png")

    game_map.setup()
    background.setup()
    cursor.setup()
}

update :: proc(){
    cursor.update()
}

render :: proc(){
    rl.BeginDrawing()
    rl.ClearBackground(rl.BLACK)

    {// RENDER
        background.render(bg_tex)
        game_map.render(game_atlas)
        cursor.render(game_atlas)
    }

    rl.EndDrawing()
}

shutdown :: proc(){
    rl.UnloadTexture(game_atlas)
}