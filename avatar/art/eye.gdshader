shader_type canvas_item;

uniform int eye_selection : hint_range(0, 7, 1);
uniform float type : hint_range(0, .5, .5);
uniform vec3 colour : source_color;

void fragment() {
	vec2 alt_UV = UV;
	//scale
	alt_UV = alt_UV * vec2(0.125,0.5);
	//offset
	float offset = .125 * float(eye_selection);
	alt_UV = alt_UV + vec2(offset,type);
	
	//sample
	float alpha = 1.0-texture(TEXTURE,alt_UV).r;
	COLOR = vec4(colour,alpha);
}
