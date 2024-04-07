use_bpm 100


sample :guit_e_slide, beat_stretch: 3, rate: 0.5




/
with_fx :reverb do
  use_synth :piano

  2.times do
    play 79, sustain: 1, release: 3
    sleep 3
    play 79, sustain: 1, release: 3
    sleep 3
    play 81, sustain: 1, release: 3
    sleep 3
    play 81, sustain: 1, release: 3
    sleep 3
    play 83, sustain: 1, release: 3
    sleep 3
    play 83, sustain: 1, release: 3
    sleep 3
    play 86, sustain: 1, release: 3
    sleep 3
    play 86, sustain: 1, release: 3
    sleep 3
  end
  2.times do
    play 79, sustain: 1, release: 3
    sleep 3
    play 79, sustain: 1, release: 3
    sleep 3
    play 81, sustain: 1, release: 3
    sleep 3
    play 81, sustain: 1, release: 3
    sleep 3
    play 83, sustain: 1, release: 3
    sleep 3
    play 83, sustain: 1, release: 3
    sleep 3
    play 86, sustain: 1, release: 3
    sleep 3
    play 86, sustain: 1, release: 3
    sleep 3
  end
end
/

/
live_loop :piano do
  with_fx :reverb do
    use_synth :piano
    play :g7, sustain: 1, release: 3

    sleep 7
    play 103, sustain: 1, release: 3
    sleep 7



  end
end


/


