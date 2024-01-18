precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 t = texture2D(tex, v_texcoord);
    gl_FragColor = vec4(1.0 - t.r, 1.0 - t.g, 1.0 - t.b, 1);
}
