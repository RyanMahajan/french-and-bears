shader_type canvas_item;

uniform float shade_strength : hint_range(0.0, 1.0) = 0.5;
uniform vec3 tint_color = vec3(0.2, 1.0, 0.2); // Green tint

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    vec3 shaded = mix(tex_color.rgb, tint_color, shade_strength);
    COLOR = vec4(shaded, tex_color.a);
}
