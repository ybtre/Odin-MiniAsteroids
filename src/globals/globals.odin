package globals

import rl "vendor:raylib"
import m "core:math/linalg/hlsl"

C_PLAYER     :: rl.Color{ 72, 107, 127, 255 }
C_ASTEROID   :: rl.Color{ 187, 71, 79, 255 }
C_BULLET     :: rl.Color{ 122, 156, 150, 255 }
C_CURSOR     :: rl.Color{ 209, 191, 176, 255 }
C_BG         :: rl.Color{ 13, 32, 27, 255 }

SCREEN : rl.Vector2 : { 840, 480 }
project_name :: "Asteroids"

NUM_ASTEROIDS :: 10
NUM_BULLETS :: 10
