shader_type canvas_item;
#include "res://src/shaders/visualize.gdshaderinc"
#include "res://src/shaders/coordinates.gdshaderinc"

void fragment() {
	COLOR = scalar_to_color(MTP_TO_ZTO(sin(UV.x * 12.0)));
	COLOR = vec2_to_color(UV);
	COLOR = dir_to_color(normalize(ZTO_TO_MTP(UV) / SCREEN_PIXEL_SIZE));
}

