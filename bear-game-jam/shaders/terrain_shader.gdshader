shader_type canvas_item;

uniform float time : hint_range(0.0, 1.0);  // Use time to animate the noise if you want
uniform vec2 chunk_size : hint_range(1.0, 100.0); // Size of a chunk in world units

// Simplex or Perlin noise function
// You can either implement your own or use a built-in function if available.
float perlin_noise(vec2 uv) {
    return sin(uv.x * 0.1 + uv.y * 0.1 + time);  // Simple placeholder noise function
}

void fragment() {
    vec2 uv = FRAGCOORD.xy / chunk_size;
    float noise_value = perlin_noise(uv);  // Get noise value based on UV position
    
    // Use smoothstep to transition smoothly between biomes
    float smooth_noise = smoothstep(0.3, 0.7, noise_value);  // Smooth transition between zones
    
    // Map the noise to a terrain type (e.g., grass, water, desert)
    if (smooth_noise > 0.6) {
        COLOR = vec4(0.2, 0.8, 0.2, 1.0);  // Grass color
    } else if (smooth_noise > 0.3) {
        COLOR = vec4(0.7, 0.7, 0.3, 1.0);  // Desert color
    } else {
        COLOR = vec4(0.1, 0.2, 0.7, 1.0);  // Water color
    }
}
