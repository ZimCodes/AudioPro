//Alien Sounds
VoicForm voice;
NRev rev;
voice => dac;
["ooo","eee","ngg","ggg","mmm"] @=> string arr[];
while(true){
   //Choose a Phoneme Name
    arr[Math.random2(0,arr.size()-1)] => string phonChoice=>voice.phoneme;
    
    //Choose a Frequency
    Math.random2f(40,130) => float frequency => voice.freq;
    1=>voice.loudness;
    
    //Debug Logs
    <<<"Choice:",phonChoice>>>;
    <<<"Freq:",frequency>>>;
    <<<"----------------------------">>>;
    
    //Duration
    1000::ms =>now;
}

