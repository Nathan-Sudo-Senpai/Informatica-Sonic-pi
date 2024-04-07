use_bpm 100

live_loop :riff do
  use_synth :growl
  riff = (ring :e3)
  play riff.tick, release: 0.5, cutoff: 80
  sleep 0.5
end

/live_loop :eng do
  with_fx :reverb, room: 0.8 do
    use_synth :piano

    # First set of 4 phrases
    8.times do
      play :g4, amp: 0.7, release: 10
      sleep 5

      if times == 3
        play :g4, amp: 0.7, release: 10
        sleep 5
        times = 0
      else
        play :c5 , release: 10
        sleep 5
        times += 1
      end
    end/

# Second set of 4 phrases with a variation on the third phrase
/4.times do
      if times == 3
        play :c6, amp: 0.7, release: 10
        sleep 5
        times = 0
      elsif times == 2
        play :c5 , release: 10
        sleep 2
        play :c5 , release: 10
        sleep 3
        times += 1
      else
        play :c5, release: 10
        sleep 5
        times += 1
      end/


