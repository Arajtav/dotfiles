precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 t = texture2D(tex, v_texcoord);
    float g = 0.2126 * t.r + 0.7152 * t.g + 0.0722 * t.b;
    gl_FragColor = vec4(vec3(g), t.a);
}
