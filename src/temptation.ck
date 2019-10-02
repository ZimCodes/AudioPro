SinOsc s;
JCRev j;
Bowed b;
//Bowed Mod
fun void bowStart(float _freq){
0.5=>b.bowPressure;
Math.randomf()=> b.bowPosition;
7.4=>b.vibratoFreq;
1=>b.volume;
0.4=>b.startBowing;
_freq=>b.freq;
}
//Reverb Mods
0.15=>j.mix;
//Suck
100 => s.freq;
-.28 =>s.gain;

//Bow Layer
fun void bowloop(){
    
    now =>time curtime;
    100=>float curfreq;
    while(true){
        if(now >= curtime + Math.random2f(1.9,2)::second){
             Math.random2f(40,210) => curfreq;
            now=> curtime;
        }
        bowStart(curfreq);
        b=>dac;
        50::ms=>now;
        b=<dac;
        50::ms=>now;
        
        }
}
//Shreds
spork~bowloop();
spork~bowloop();
while(true){
    s =>j=> dac;
    200::ms => now;
    s =<j=< dac;
    200::ms => now;
}
