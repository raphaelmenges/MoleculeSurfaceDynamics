//============================================================================
// Distributed under the MIT License. Author: Raphael Menges
//============================================================================

#version 430

uniform vec3 color;

layout(location = 0) out vec4 fragColor;

void main()
{
    fragColor = vec4(color, 1);
}
