precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float offset = 0.001;

// -1 to 1
float rand(vec2 co) {
    return (2.0*fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453))-1.0;
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
    vec2 offset_r = vec2(rand(new_uv + vec2(0.0, 0.0)), rand(new_uv + vec2(0.0, 1.0)));
    vec2 offset_g = vec2(rand(new_uv + vec2(1.0, 0.0)), rand(new_uv + vec2(1.0, 1.0)));
    vec2 offset_b = vec2(rand(new_uv + vec2(2.0, 0.0)), rand(new_uv + vec2(2.0, 1.0)));
    float r = texture2D(tex, v_texcoord + offset*offset_r).r;
    float g = texture2D(tex, v_texcoord + offset*offset_g).g;
    float b = texture2D(tex, v_texcoord + offset*offset_b).b;
    gl_FragColor = vec4(r, g, b, texture2D(tex, v_texcoord).a);
}
