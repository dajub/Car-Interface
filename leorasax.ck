//Leora Huebner-- chuck patch for sax sound for networking project

Saxofony sax => JCRev r => dac;
0 => r.gain;
.05 => r.mix;

// create our OSC receiver
OscRecv OSCin;
// create our OSC message
OscMsg msg;
// use port 1239 
1239 => OSCin.port;
//start listening to OSC messages
OSCin.listen();

float myFreq;
float myGain;

OSCin.event("/myFreq,f") @=> OscEvent freq_event; 
OSCin.event("/myVolume,f") @=> OscEvent volume_event; 
OSCin.event("/myVib,f") @=> OscEvent vib_event; 


0.243011 => sax.stiffness;
0.724126 => sax.aperture;
0.239403 => sax.blowPosition;
0.475535 => sax.noiseGain;
3.983349 => sax.vibratoFreq;
0.740061 => sax.vibratoGain;
0.863492 => sax.pressure;

spork~ receiveFreq();
spork~ receiveVolume();
spork~ receiveVib();

while(true)
{
    // just passing time
    1::second => now;
}


fun void receiveVolume()
{
    while ( true )
    {
        volume_event => now;        
        while ( volume_event.nextMsg() != 0 )
        { 
            volume_event.getFloat() => myGain;
            myGain => r.gain;
        }
    }
}

fun void receiveVib()
{
    while ( true )
    {
        vib_event => now;        
        while ( vib_event.nextMsg() != 0 )
        { 
            vib_event.getFloat() => sax.vibratoGain;
        }
    }
}


fun void receiveFreq()
{
    while (true)
    {
        freq_event => now;
        while ( freq_event.nextMsg()  != 0 )
        { 
            freq_event.getFloat() => myFreq;
            if (myFreq > 0)
            { 
            myFreq => sax.freq;
            Math.random2f( .6, .9 ) => sax.noteOn;      
            }
        }
    }
}


