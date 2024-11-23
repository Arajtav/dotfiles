precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float round(float val) {
    return floor(val+0.5);
}

float sp(float val, float grad) {
    return round(val*grad)/grad;
}

void main() {
    float d = 2.0;
    vec4 m = texture2D(tex, vec2(sp(v_texcoord.x, 1920.0/d), sp(v_texcoord.y, 1080.0/d)));
    vec4 t = texture2D(tex, v_texcoord);
    gl_FragColor = t*0.5 + m*0.5;
}
