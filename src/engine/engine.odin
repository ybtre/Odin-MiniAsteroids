package engine

import rl "vendor:raylib"

initialize :: proc(){

}

update :: proc(){

}

render :: proc(){
    rl.BeginDrawing()
    rl.ClearBackground(rl.BLACK)

    rl.DrawText("Jnj", 100, 100, 40, rl.ORANGE)
    rl.EndDrawing()
}

shutdown :: proc(){
    
}