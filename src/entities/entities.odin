package entities

import rl "vendor:raylib"

UPGRADE_TYPES :: enum {
    FIRE_RATE,
    PLAYER_SPEED,
    BULLET_SPEED,
}

// @(private)
Sprite :: struct {
    src: rl.Rectangle,
    dest: rl.Rectangle,
    center: rl.Vector2,
}

Entity :: struct {
    is_alive: bool,
    rec: rl.Rectangle,
    spr: Sprite,

    color: rl.Color,
    speed: f32,
    move_dir: rl.Vector2,
}

AnimData :: struct {
    is_active: bool,
    counter: i32,
    curr_frame: i32,
    total_frames: i32,
}

EasingData :: struct {

}

Cursor :: struct {
    spr: Sprite,
}

Button :: struct {
    rec: rl.Rectangle,
    spr: Sprite,
    is_highlighted: bool,
    is_pressed: bool,
    upgrade: UPGRADE_TYPES,
}

PlayerStats :: struct {
    lives: i32,
    curr_xp: i32,
    total_xp: i32,
    req_xp: f32,
    fire_rate: f32,
    fire_rate_timer: f32,
    xp_pickup_range: f32,
}

Player :: struct {
    ent: Entity,
    engine_spr: Sprite,
    engine_anim: AnimData,
    stats:  PlayerStats,
    rot: f32,
}

Asteroid :: struct {
    ent: Entity,
    rot: f32,
}

XP_Orb :: struct {

}

Bullet :: struct {
    ent: Entity,
    anim: AnimData,
    rot: f32,
    lifetime: f32,
    lifetime_timer: f32,
}

Explosion :: struct {
    spr: Sprite,
    anim: AnimData,
}

GameMap :: struct {
    spr: Sprite,
}

Background :: struct {
    spr: Sprite,
}