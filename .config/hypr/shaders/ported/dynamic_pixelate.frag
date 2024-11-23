precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float trh = 0.771;
float mi = 2.0;
vec3 color_offset = vec3(0.5, 0.5, 0.5);

// divide val from 0 to 1 to s framents
// float p(float val, float s) { return floor(val*s)/s; }
#define p(val, s) (floor(val*s)/s)

float avg(vec4 v) {
    float l = v.r*0.2126 + v.g*0.7152 + v.b*0.0722;
    return 1.0-((1.0-l)*(1.0-l));   // curve, TODO: remove it. it's literallt not neeeded, just change trh.
}

// scan sd*sd grid, if value is below trh, do same thing for sd*sd grid in this fragment
// at least that is what i wanted, i have no idea what i did
vec4 recproc(float sd, vec2 tps) {
    vec4 d;
    while (true) {
        sd = sd * 2.0;
        d = texture2D(tex, vec2(p(v_texcoord.x, sd), p(v_texcoord.y, sd)));
        if ((avg(d) > trh)) { d.rgb+=((color_offset*2.0)-vec3(1.0)); break; }

        // no point of trying when sd is bigger than texture, because it will be sampling the same thing in loop
        if ((sd > 1.0/tps.x) || (sd > 1.0/tps.y)) { break; }
    }
    return d;
}

void main() {
    gl_FragColor = recproc(pow(2.0, mi), vec2(1.0/1920.0, 1.0/1080.0)); // TODO: check if there is a way to get size of tex
}
