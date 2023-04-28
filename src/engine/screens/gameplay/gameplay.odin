package screen_gameplay

import "core:fmt"

import rl "vendor:raylib"
import "../../../globals"
import "../../../entities/player"
import "../../../entities/asteroid"
import "../../../entities/game_map"
import "../../../entities/cursor"
import "../../../entities/background"
import "../../game_overlord"

update :: proc() {
    cursor.update()

    if rl.IsKeyPressed(rl.KeyboardKey.P){
        game_overlord.is_paused = !game_overlord.is_paused
    }
    if !game_overlord.is_paused
    {
        game_overlord.gameplay_time_total += rl.GetFrameTime()

        if game_overlord.is_wave_starting{
            if game_overlord.current_wave >= game_overlord.NUM_WAVES
            {
                game_overlord.set_current_screen(game_overlord.SCREENS.MAIN_MENU)
                return
            }
            game_overlord.set_current_wave_dur()
            game_overlord.is_wave_starting = false;
        }

        if player.p.stats.curr_xp >= i32(player.p.stats.req_xp)
        {
            player.p.stats.curr_xp = 0
            //increase req xp player

            // randomize upgrade buttons
            game_overlord.set_current_screen(game_overlord.SCREENS.UPGRADE)
        }

        game_overlord.wave_duration -= rl.GetFrameTime()
        if game_overlord.wave_duration < 0 
        {
            game_overlord.current_wave += 1
            game_overlord.is_wave_starting = true
        }

        asteroid.asteroid_wave_spawner()
        //screen shake

        // player wrap in screen limits?

        //update player

        asteroid.update()

        //player shooting

        // update explosions

        // update bullets

        //update xporbvs

        //collision detection
    }
    else 
    {
        game_overlord.pause_blink_counter += 1
    }
    fmt.println("UPDATEEEE")

}

render :: proc(){
    using rl
    using globals
    fmt.println("SPACEEEEEEEEE")

    //add raylib cam2d
    // if !player.p.ent.is_alive
    // {
    //     game_overlord.set_current_screen(game_overlord.SCREENS.GAME_OVER)
    // }
    // else { //------Objects Render------//
            background.render()

			// RenderGameMap(map_grid, game_atlas);
            game_map.render()

			// RenderXPOrbs(xp_orbs, game_atlas);

            asteroid.render()

			// RenderBullets(bullets, ARR_BULLETS, game_atlas);

			// RenderExplosions(explosions, ARR_EXPLOSIONS, game_atlas);

			// RenderPlayer(player, game_atlas);

            cursor.render()
    // }
    
}