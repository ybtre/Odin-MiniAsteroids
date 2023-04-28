package game_overlord

import rl "vendor:raylib"

NUM_WAVES :: 10

score := 0

current_screen : SCREENS

is_paused := false
pause_blink_counter := 0

current_wave := 0
gameplay_time_total : f32 = 0.0
gameplay_time_current := 0.0
wave_duration : f32 = 0.0
is_wave_starting := false

waves : [NUM_WAVES]Wave = {
        { 1, 10.9, 1.0 },
		{ 2, 12.9, .8 },
		{ 3, 14.9, .7 },
		{ 4, 16.9, .65 },
		{ 5, 20.9, .625 },
		{ 6, 25.9, .6 },
		{ 7, 35.9, .55 },
		{ 8, 40.9, .5 },
		{ 9, 50.9, .4 },
		{ 10, 60.9, .2 },
}

live_src : rl.Rectangle
live_dest : rl.Rectangle
score_src : rl.Rectangle
score_dest : rl.Rectangle

Wave :: struct {
    level: i32,
    duration: f32,
    enemy_spawn_interval: f32,
}

SCREENS :: enum {
    MAIN_MENU,
    GAMEPLAY,
    GAME_OVER,
    UPGRADE,
}