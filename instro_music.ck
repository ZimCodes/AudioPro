Mandolin m;//Instrument
JCRev jrev;//Reverberator

fun void MandolinOpt(dur _dur,float _freq){
Math.randomf() => m.bodySize;
Math.randomf()=>m.pluckPos;
0.5 =>m.stringDamping;
Math.random2f(0.8,0.9)=> m.stringDetune;
Math.random2f(0.3,0.75)=>m.pluck;
_freq => m.freq;
_dur=>now;
}

/*Second layer of instruments
_freq= between 150-170;_dur =.25*/
fun void secThread(float _freq){
    while(true){
        MandolinOpt(.25::second,_freq);
        }
    
}

//reverb mixer
0.1 => jrev.mix;
//Chuck to output
m=>jrev=>dac;
//Play Second layer
spork~secThread(150);
//play First Layer
while(true){
    MandolinOpt(.5::second, 290);
    
}
