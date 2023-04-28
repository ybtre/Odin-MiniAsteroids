package background

import rl "vendor:raylib"
import "../../globals"
import "../../entities"

bg : entities.Background
tex : ^rl.Texture2D

setup :: proc( bg_tex : ^rl.Texture2D){
    using globals

    tex = bg_tex

    bg.spr.src = { 0, 0, 420, 315}
    bg.spr.dest =  { -35, -35, bg.spr.src.width * 2.64, bg.spr.src.height * 2.64 }
    bg.spr.center = { 0, 0 }
}

render :: proc(){
    rl.DrawTexturePro(tex^, bg.spr.src, bg.spr.dest, bg.spr.center, 0, rl.WHITE)
}