amp_invalGitaar = (ramp *(range 0,0.8,0.05))
amp_afvalPiano = (ramp *(range 1,0,-0.05))
amp_afvalPiano2 = (ramp *(range 0.8,0,-0.05))

Gitaar = "C:/Users/Gebruiker/Documents/Sonic pi/Samples/Gitaar"

live_loop :afterGitaar do
  synth :piano do
    with_fx :reverb do
      4.times do
        3.times do
          play :c5, release: 10, amp: amp_afvalPiano.tick
          with_fx :reverb, room: 0.5 do
            sample Gitaar, "overdriven-guitar-single-chord-long-release_A_minor", amp: amp_invalGitaar.tick
          end
          sleep 3.25
        end
        1.times do
          with_fx :reverb, room: 0.6 do
            play :b, amp: amp_afvalPiano2.tick, release: 20
            sample Gitaar, "overdriven-guitar-single-chord-long-release_A_minor", amp: amp_invalGitaar.tick
            sleep 3.25
          end
        end
      end
    end
  end
end