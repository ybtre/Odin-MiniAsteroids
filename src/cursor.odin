package mini_asteroids 

import rl "vendor:raylib"

mouse_cursor : Cursor

get_cursor_pos  :: proc() -> rl.Vector2 {
    return rl.Vector2{ mouse_cursor.spr.dest.x, mouse_cursor.spr.dest.y }
}

setup_cursor :: proc(){
    rl.HideCursor()

    mouse_cursor.spr.src = { 104, 0, SPRITE_SIZE, SPRITE_SIZE }
    mouse_cursor.spr.dest = {
        f32(rl.GetMouseX()), f32(rl.GetMouseY()),
        mouse_cursor.spr.src.width * SPRITE_SCALE_MULTI,
        mouse_cursor.spr.src.height * SPRITE_SCALE_MULTI,}

    mouse_cursor.spr.center = {
        (mouse_cursor.spr.src.width * SPRITE_SCALE_MULTI) / 2,
        (mouse_cursor.spr.src.height * SPRITE_SCALE_MULTI) / 2,
    }
}

update_cursor :: proc(){
    mouse_cursor.spr.dest.x = f32(rl.GetMouseX())
    mouse_cursor.spr.dest.y = f32(rl.GetMouseY())
}

render_cursor :: proc(){
    rl.DrawTexturePro(
		game_atlas,
		mouse_cursor.spr.src,
		mouse_cursor.spr.dest,
		mouse_cursor.spr.center,
		0,
		rl.WHITE);
}