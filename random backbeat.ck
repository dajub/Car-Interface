2 => int reps;
0 => int counter;

float myPattern[16];

class myClass
{
    Impulse imp => NRev r => LPF f;
    
    fun void connect(UGen ug) {
        f => ug;
    }
    fun void click() {
        10 => imp.next;
    }
    fun void cutoff(float myFreq) {
        f.freq(myFreq);
    }
}

// like we did in class, changing up the backbeat with random 
// values every so often
fun void randomize() {
    for (0 => int i; i<16; i++) {
        Math.random2f(30.0, 100.0) => myPattern[i];
    }
}

fun void playHH()
{
    Noise n => HPF f => ADSR e => dac;
    f.freq(8000.0);
    n.gain(.05);
    e.set(2::ms, 100::ms, 0.0, 100::ms);
    e.keyOn();
    1::second => now;
}

// backbeat
fun void sporking(myClass pulse) {
    while (true) {
        if (counter%3 == 0 || counter%8 == 0) spork~playHH();
        pulse.click();
        pulse.cutoff(Std.mtof(myPattern[counter%16]));
        counter++;
        
        if ((counter % (reps*16)) == 0) randomize(); 
        .125::second => now;
    }
}

myClass pulse;
pulse.connect(dac);
randomize();
spork~sporking(pulse);
20::second => now;