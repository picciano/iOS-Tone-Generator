iOS-Tone-Generator
==================

Tone Generator for iOS

A reusable Tone Generator class roughly based upon the fine work of Matt Galagher, http://www.cocoawithlove.com/2010/10/ios-tone-generator-introduction-to.html



A reusable class for generating simple sine waveform audio tones with specified frequency and amplitude. Can play continuously or for a specified duration.


### Multiple Channels

You can add more than one tone channel, for example to generate [DTMF](http://en.wikipedia.org/wiki/Dual-tone_multi-frequency_signaling)
tones. These are the tones you may hear when dialing on a keypad (either analog or even on iOS in the Telephone.app)

![DTMF Keypad](http://upload.wikimedia.org/wikipedia/commons/0/03/Phone_keypad_layout_color.png)

```Objective-C
unichar c = '2'; // Example character, from a keypad

TGSineWaveToneGenerator *gen = [[TGSineWaveToneGenerator alloc] initWithChannels:2];
// DTMF keypad frequencies
double freqA[] = {1209, 1336, 1477};
double freqB[] = {697, 770, 852};
if (c == '0') {
    _toneGenerator->_channels[0].frequency = 1336;
    _toneGenerator->_channels[1].frequency = 941;
} else if ('0' < c && c <= '9') {
    c = c -'1';
    _toneGenerator->_channels[0].frequency = freqA[c % 3];
    _toneGenerator->_channels[1].frequency = freqB[c / 3];
} else if (c == '#') {
    _toneGenerator->_channels[0].frequency = 1477;
    _toneGenerator->_channels[1].frequency = 941;
} else {// Not sure
    _toneGenerator->_channels[0].frequency = 1209;
    _toneGenerator->_channels[1].frequency = 941;
}
[_toneGenerator playForDuration:0.15];
```
