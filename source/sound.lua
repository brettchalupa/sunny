local synth = playdate.sound.synth.new(playdate.sound.kWaveSine)

-- Plays the specified note in the kWaveSine synth
function PlaySFX(note)
  synth:playMIDINote(note, 0.5, 0.10)
end
