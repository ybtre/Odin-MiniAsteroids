package asteroids

import rl "vendor:raylib"
import "../../globals"
import "../utils"
import "../../entities"
import "../../entities/player"
import "../../engine/game_overlord"

tex : ^rl.Texture2D

asteroids : [globals.NUM_ASTEROIDS]entities.Asteroid
asteroid_spawn_timer : f32

asteroid_wave_spawner :: proc(){
    using globals 

    asteroid_spawn_timer += rl.GetFrameTime()

    if asteroid_spawn_timer >= game_overlord.get_current_wave_data().enemy_spawn_interval {
        for i in 0..< NUM_ASTEROIDS {
            if !asteroids[i].ent.is_alive {
                spawn_asteroid(&asteroids[i])
                break;
            }
        }

        asteroid_spawn_timer = 0
    }
}

spawn_asteroid :: proc( ASTEROID : ^entities.Asteroid){
    using globals

    ASTEROID.ent.is_alive = false;

    ASTEROID.ent.rec = {
        f32(rl.GetRandomValue(MAP_OFFSET_X, MAP_OFFSET_X + (SPRITE_SIZE_SCALED * MAP_SIZE))),
        f32(rl.GetRandomValue(MAP_OFFSET_X, MAP_OFFSET_X + (SPRITE_SIZE_SCALED * MAP_SIZE))),
        SPRITE_SIZE_SCALED, SPRITE_SIZE_SCALED,}

    for rl.CheckCollisionCircleRec(rl.Vector2{player.p.ent.spr.dest.x, player.p.ent.spr.dest.y}, 250.0, ASTEROID.ent.rec)
        {
            ASTEROID.ent.rec = {
                f32(rl.GetRandomValue(MAP_OFFSET_X, MAP_OFFSET_X + (SPRITE_SIZE_SCALED * MAP_SIZE))),
                f32(rl.GetRandomValue(MAP_OFFSET_X, MAP_OFFSET_X + (SPRITE_SIZE_SCALED * MAP_SIZE))),
                SPRITE_SIZE_SCALED, SPRITE_SIZE_SCALED,}
        }

        ASTEROID.ent.spr.src = { 64, 0, SPRITE_SIZE, SPRITE_SIZE }
        ASTEROID.ent.spr.dest = {
            ASTEROID.ent.rec.x + SPRITE_OFFSET,
            ASTEROID.ent.rec.y + SPRITE_OFFSET,
            ASTEROID.ent.spr.src.width * SPRITE_SCALE_MULTI,
            ASTEROID.ent.spr.src.height * SPRITE_SCALE_MULTI,
        }
        ASTEROID.ent.spr.center = {
            (ASTEROID.ent.spr.src.width * SPRITE_SCALE_MULTI) / 2,
            (ASTEROID.ent.spr.src.height * SPRITE_SCALE_MULTI) / 2,
        }
    
        ASTEROID.ent.color = C_ASTEROID
        ASTEROID.rot = 0
        random_multi: i32 = rl.GetRandomValue(-25, 25)
        for random_multi == 0 {
            random_multi =  rl.GetRandomValue(-25, 25)
        }
        ASTEROID.ent.speed = 120;
        ASTEROID.ent.is_alive = true;
}

update :: proc() {
    using globals

    for i in 0..<NUM_ASTEROIDS{
        if asteroids[i].ent.is_alive
        {
            move_asteroid(&asteroids[i])
        }
    }
}

move_asteroid :: proc( ASTEROID : ^entities.Asteroid) {
    using globals

    pos := rl.Vector2 { ASTEROID.ent.rec.x, ASTEROID.ent.rec.y };
	target := rl.Vector2 { player.p.ent.rec.x, player.p.ent.rec.y };
    pos = utils.vec2_move_towards(pos, target, rl.GetFrameTime() * ASTEROID.ent.speed)

	ASTEROID.ent.rec.x = pos.x;
	ASTEROID.ent.spr.dest.x = ASTEROID.ent.rec.x + SPRITE_OFFSET;
	ASTEROID.ent.rec.y = pos.y;
	ASTEROID.ent.spr.dest.y = ASTEROID.ent.rec.y + SPRITE_OFFSET;
}

reset_asteroids :: proc() {
    using globals 

    for i in 0..<NUM_ASTEROIDS
    {
        if asteroids[i].ent.is_alive
        {
            destroy_asteroid(&asteroids[i])
        }
    } 
}

destroy_asteroid :: proc(ASTEROID : ^entities.Asteroid) {
    ASTEROID.ent.is_alive = false
    ASTEROID.ent.rec.x = -100
    ASTEROID.ent.rec.y = -100
}

setup :: proc( TEX : ^rl.Texture2D){
    using globals
    tex = TEX

    for i in 0..< NUM_ASTEROIDS {
        asteroids[i].ent.is_alive = false

        asteroids[i].ent.rec = {
            -100, - 100,
            SPRITE_SIZE_SCALED, SPRITE_SIZE_SCALED,}

        asteroids[i].ent.spr.src = { 64, 0, SPRITE_SIZE, SPRITE_SIZE }
        asteroids[i].ent.spr.dest = {
            asteroids[i].ent.rec.x + SPRITE_OFFSET,
            asteroids[i].ent.rec.y + SPRITE_OFFSET,
            asteroids[i].ent.spr.src.width * SPRITE_SCALE_MULTI,
            asteroids[i].ent.spr.src.height * SPRITE_SCALE_MULTI,}

        asteroids[i].ent.spr.center = {
            (asteroids[i].ent.spr.src.width * SPRITE_SCALE_MULTI) / 2,
            (asteroids[i].ent.spr.src.height * SPRITE_SCALE_MULTI) / 2,}

        asteroids[i].ent.color = C_ASTEROID
        asteroids[i].rot = 0
        asteroids[i].ent.speed = 120
        asteroids[i].ent.move_dir = { 0, 0 }
    }
}

render :: proc() {
    using globals  

    for i in 0..<NUM_ASTEROIDS{
		if (asteroids[i].ent.is_alive) {
			rl.DrawRectangleLinesEx(asteroids[i].ent.rec, 1, asteroids[i].ent.color);
			rl.DrawTexturePro(tex^,
			               asteroids[i].ent.spr.src,
			               asteroids[i].ent.spr.dest,
			               asteroids[i].ent.spr.center,
			               asteroids[i].rot,
			               rl.WHITE);
		}
	}
}