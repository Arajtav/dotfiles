precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float round(float val) {
    return floor(val + 0.5);
}

float hgrad = 6.0;
float sgrad = 3.0;
float lgrad = 4.0;

float hmove = 0.0;
float smove = 0.0;
float lmove = 0.0;

float sph(float val) { return round(val*pow(2.0, hgrad)+hmove)/pow(2.0, hgrad); }
float sps(float val) { return round(val*pow(2.0, sgrad)+smove)/pow(2.0, sgrad); }
float spl(float val) { return round(val*pow(2.0, lgrad)+lmove)/pow(2.0, lgrad); }

bool fcompare(float a, float b) { return abs(a - b) < 0.0001; }

// https://gist.github.com/ciembor/1494530
// modified a bit

vec3 hsl(vec3 col) {
    vec3 result;
    float mx = max(max(col.r, col.g), col.b);
    float mi = min(min(col.r, col.g), col.b);
    
    result.r = result.g = result.b = (mx + mi) / 2.0;
    
    if (fcompare(mx, mi)) {
        result.r = result.g = 0.0; // achromatic
    } else {
        float d = mx-mi;
        result.g = (result.b > 0.5) ? d / (2.0-mx-mi) : d / (mx+mi);
        if (fcompare(mx, col.r)) {
            result.r = (col.g - col.b) / d + (col.g < col.b ? 6.0 : 0.0);
        } else if (fcompare(mx, col.g)) {
            result.r = (col.b - col.r) / d + 2.0;
        } else if (fcompare(mx, col.b)) {
            result.r = (col.r - col.g) / d + 4.0;
        }
        
        result.r /= 6.0;
    }
    
    return result;
}

float hue2rgb(float p, float q, float t) {
    if (t < 0.0) 
        t += 1.0;
    if (t > 1.0) 
        t -= 1.0;
    if (t < 1.0/6.0) 
        return p + (q - p) * 6.0 * t;
    if (t < 1.0/2.0) 
        return q;
    if (t < 2.0/3.0)   
        return p + (q - p) * (2.0/3.0 - t) * 6.0;
    return p; 
}

vec3 hsl2rgb(vec3 cal) {
    vec3 result;
    if(fcompare(cal.g, 0.0)) {
        result.r = result.g = result.b = cal.b; // achromatic
    }
    else {
        float q = cal.b < 0.5 ? cal.b * (1.0 + cal.g) : cal.b + cal.g - cal.b * cal.g;
        float p = 2.0 * cal.b - q;
        result.r = hue2rgb(p, q, cal.r + 1.0/3.0);
        result.g = hue2rgb(p, q, cal.r);
        result.b = hue2rgb(p, q, cal.r - 1./3.0);
    }
    return result;
}

void main() {
    vec4 t = texture2D(tex, v_texcoord);
    vec3 chsl = hsl(t.rgb);
    vec3 new = hsl2rgb(vec3(sph(chsl.r), sps(chsl.g), spl(chsl.b)));
    gl_FragColor = vec4(new, t.a);
}
