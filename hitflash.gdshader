shader_type canvas_item;
uniform float flash = 0;
const vec4 WHITE = vec4(1,1,1,1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = WHITE*flash*COLOR.a + COLOR*(1.0 - flash);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
