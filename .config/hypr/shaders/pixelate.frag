precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float p(float val, float s) {
	return floor(val*s)/s;
}

float avg(vec4 v) {
	float l = v.r*0.2126 + v.g*0.7152 + v.b*0.0722;
	return 1.0-((1.0-l)*(1.0-l));
}

void main() {
    float mi = 3.0;
    float mx = 8.0;
    float trh = 0.83;
    float sd = pow(2.0, mi);
	vec4 d;
	while (sd <= pow(2.0, mx)) {
		sd = sd * 2.0;
		d = texture2D(tex, vec2(p(v_texcoord.x, sd), p(v_texcoord.y, sd)));
		if (avg(d) > trh) { break; }
	}
    gl_FragColor = d;
}
