precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float offset = 0.001;

vec2 offset_r = vec2(offset, 0.0);
vec2 offset_g = vec2(0.0, offset);
vec2 offset_b = vec2(-offset, 0.0);

void main() {
    offset_r += v_texcoord;
    offset_g += v_texcoord;
    offset_b += v_texcoord;

    vec4 offset_color = texture2D(tex, v_texcoord);
    offset_color.r = texture2D(tex, offset_r).r;
    offset_color.g = texture2D(tex, offset_g).g;
    offset_color.b = texture2D(tex, offset_b).b;

    gl_FragColor = offset_color;
}
