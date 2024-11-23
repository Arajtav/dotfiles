precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float p(float val, float s) {
    return floor(val*s)/s;
}

float rgbavg(vec4 v) {
    return (v.r+v.g+v.b)/3.0;
}

float cpow(float a) {
    float ra = 0.797;
    a = 1.0-a;
    a = 1.0-pow(a, ra);
    return pow(a, ra);
}

void main() {
    float trh = 0.565;
    float p_mix = 0.272;
    float ml = 32.0;
    float h = 16.0;
    vec2 luv = vec2(p(v_texcoord.x, h), p(v_texcoord.y, h));
    float f = cpow(rgbavg(texture2D(tex, luv)));
    while (f > trh) {
        if (h > pow(2.0, ml)) { break; }
        h = h*2.0;
        luv = vec2(p(v_texcoord.x, h), p(v_texcoord.y, h));
        f = cpow(rgbavg(texture2D(tex, luv)));
    }
    
    gl_FragColor = mix(texture2D(tex, luv), texture2D(tex, v_texcoord), p_mix);
}
