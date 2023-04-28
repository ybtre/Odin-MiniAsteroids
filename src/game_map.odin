package mini_asteroids 

import rl "vendor:raylib"

map_grid : GameMap

setup_game_map :: proc() {
    map_grid.spr.src = { 40, 0, SPRITE_SIZE, SPRITE_SIZE }
    map_grid.spr.dest = { MAP_OFFSET_X, MAP_OFFSET_Y, map_grid.spr.src.width * SPRITE_SCALE_MULTI, map_grid.spr.src.height * SPRITE_SCALE_MULTI }
    map_grid.spr.center = { map_grid.spr.src.width * SPRITE_SCALE_MULTI / 2, map_grid.spr.src.height * SPRITE_SCALE_MULTI / 2 }
}

render_game_map :: proc(){
    for x := 0; x < MAP_SIZE; x += 1 {
        for y := 0; y < MAP_SIZE; y += 1 
        {
            map_grid.spr.dest.x = f32(x * SPRITE_SIZE_SCALED)    
            map_grid.spr.dest.y = f32(y * SPRITE_SIZE_SCALED)    
            map_grid.spr.dest.x += MAP_OFFSET_X
            map_grid.spr.dest.y += MAP_OFFSET_Y

            rl.DrawTexturePro(
                game_atlas,
                map_grid.spr.src,
                map_grid.spr.dest,
                map_grid.spr.center,
                0,
                C_GAME_MAP)
        }
    }
}