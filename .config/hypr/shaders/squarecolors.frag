precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float offset = 0.001;

const float m = 1.0/192.0;
// -m to m
float rand(vec2 co) {
    return m*(fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453)-0.5);
}

float gcd(vec2 v) {
    int kill = 0;
    while (v.y > 0.0) {
        v = vec2(v.y, mod(v.x, v.y));
        if (kill++ == 512) {
            return 1.0;
        } // excuse me???, HOW IS THAT WORKING, IT ALWAYS GETS THE SAME VALUE, AND WITH KILLSWITCH IT STILL WORKS, SO IN WHAT CASE IT STUCKS
    }
    return v.x;
}

vec2 get_uv(vec2 uv, vec2 tsx) {
    float gcds = gcd(tsx);
    vec2 tmp = vec2(tsx.x / gcds, tsx.y / gcds);
    return vec2(floor(uv.x * tmp.x) / tmp.x, floor(uv.y * tmp.y) / tmp.y);
}

void main() {
    // TODO: GET SCREEN SIZE
    const vec2 screen = vec2(1920.0, 1080.0);
    vec2 new_uv = get_uv(v_texcoord, screen);
    vec4 col = texture2D(tex, v_texcoord);
    gl_FragColor = vec4(col.rgb+vec3(rand(new_uv)), col.a);
}
