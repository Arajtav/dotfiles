precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float round(float val) {
    return floor(val+0.5);
}

float sp(float val) {
    // best is 1 to 8;
    float grad = 2.0;
    return round(val*pow(2.0, grad))/pow(2.0, grad);
}

void main() {
    vec4 t = texture2D(tex, v_texcoord);
    gl_FragColor = vec4(sp(t.r), sp(t.g), sp(t.b), t.a);
}
