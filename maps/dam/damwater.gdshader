shader_type spatial;

uniform vec3 albedo: source_color;
uniform float metallic: hint_range(0.0, 1.0) = 0.0;
uniform float roughness: hint_range(0.0, 1.0) = .02;
uniform sampler2D tex_norm;
uniform sampler2D tex_norm2;
uniform vec2 wave_direction = vec2(2.0,0.0);
uniform vec2 wave_direction2 = vec2(0.0,1.0);
uniform float time_scale : hint_range(0.0, 0.2, 0.005) = 0.025;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec3 normal = texture(tex_norm, UV).rgb;
	vec2 time = (TIME * wave_direction) * time_scale;
	vec2 time2 = (TIME * wave_direction2) * time_scale;
	vec3 normal_blend = mix(texture(tex_norm,UV + time).rgb, texture(tex_norm2,UV + time2).rgb, 0.5);

	ALBEDO = albedo;
	METALLIC = metallic;
	ROUGHNESS = roughness;
	NORMAL_MAP = normal;
}

void light() {
	// Called for every pixel for every light affecting the material.
}
