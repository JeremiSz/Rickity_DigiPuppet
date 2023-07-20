shader_type spatial;

uniform vec3 colour : source_color;
uniform sampler2D Texture;

uniform int eye_selection : hint_range(0, 7, 1);
uniform float type : hint_range(0, .5, .5);

void fragment() {
	vec2 alt_UV = UV;
	//scale
	alt_UV = alt_UV * vec2(0.125,0.5);
	//offset
	float offset = .125 * float(eye_selection);
	alt_UV = alt_UV + vec2(offset,type);
	
	//sample
	ALPHA = 1.0-texture(Texture,alt_UV).r;
	ALBEDO = colour;
}
