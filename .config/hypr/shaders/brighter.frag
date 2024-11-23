precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 t = texture2D(tex, v_texcoord);
    gl_FragColor = vec4(t.rgb * 1.5 , t.a);
}
