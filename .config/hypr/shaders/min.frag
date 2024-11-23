precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float avg3(vec4 a) {
    return (a.r + a.g + a.b) / 3.0;
}

void main() {
    float t = 0.015;
    int i = 0;
    float b = 0.0;
    while (b < 1.0) {
        b = v_texcoord.x + (float(i) * 1.0/1920.0);
        if (t+avg3(texture2D(tex, v_texcoord)) < avg3(texture2D(tex, vec2(b, v_texcoord.y)))) { break; }
        i++;
    }
    gl_FragColor = texture2D(tex, vec2(b, v_texcoord.y));
}
