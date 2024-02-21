#define VXP_LOW_COLOR vec4(0.0, 0.6, 0.5, 1.0)
#define VXP_HIGH_COLOR vec4(0.9, 0.0, 0.8, 1.0)

#include "coordinates.gdshaderinc"

vec4 scalar_to_color(float a)
{
	return mix(VXP_LOW_COLOR, VXP_HIGH_COLOR, a);
}

vec4 vec2_to_color(vec2 a)
{
	return vec4(a.x, a.y, 0.2, 1.0);
}

vec4 dir_to_color(vec2 a)
{
	return clamp(vec4(0.0), vec4(1.0),vec4(
		dot(a, vec2(cos(0.0), sin(0.0))),
		dot(a, vec2(cos(TAU/3.0), sin(TAU/3.0))),
		dot(a, vec2(cos(2.0*TAU/3.0), sin(2.0*TAU/3.0))),
		1.0
	));
}