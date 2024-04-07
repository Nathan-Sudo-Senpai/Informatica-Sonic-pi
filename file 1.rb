Gitaar = "C:/Users/Gebruiker/Downloads/Samples/Gitaar"
Effects = "C:/Users/Gebruiker/Downloads/Samples/Effects"


use_bpm 200
speed = 5
amp_inval = (ramp *(range 4,2.4,-0.1))
amp_invalGitaar = (ramp *(range 0,0.8,0.05))
amp_afvalPiano = (ramp *(range 1,0,-0.05))
amp_afvalPiano2 = (ramp *(range 0.8,0,-0.05))
amp_invalHeartbeat = (ramp *(range 1,2.5,0.0625))
times = 0
bed = 5
bed2 = 4
slaap = 0
a = 0.7
tel = 0

define :sigh do
  with_fx :reverb, room: 0.7, pre_amp: 2 do
    
    sample Effects, "43565-HUMAN_BREATHE_INHALE_SHORT_EXHALE_LONG_01", rate: 0.8
    
  end
end



/define :guitarBegin do

  live_loop :afterGitaar do
    4.times do
      3.times do
        play :c5, release: 10, amp: amp_afvalPiano.tick
        sample Gitaar, "overdriven-guitar-single-chord-long-release_A_minor", amp: amp_invalGitaar.tick

        sleep bed

      end
      1.times do
        with_fx :reverb do

          play :b, amp: amp_afvalPiano2.tick, release: 20
          sample Gitaar, "overdriven-guitar-single-chord-long-release_A_minor", amp: amp_invalGitaar.tick
          sleep bed
        end
      end
    end
  end
end/


define :heartbeat do
  
  live_loop :heart do
    with_fx :echo, phase: 1, max_phase: 0.5 do
      synth :fm, note: :c1 , amp: amp_invalHeartbeat.tick, pan: a
      sleep 3.5
      if a >= 0 then
        a = a - 1.4
        
      else
        a = a + 1.4
      end
    end
  end
end




/define :eden do

  live_loop :iets do
    if tel == 20 then
      stop
    else
      with_fx :reverb do
        sample Gitaar, "power-chord-metal-guitar-sustained_B_minor", num_slices: 40, slice: 0, pitch: 0.4, amp: amp_inval.tick, rate: 0.05
        sleep 2
      end
    end
  end
end/

define :genesis do
  
  with_fx :reverb do
    with_fx :reverb do
      use_synth :piano
      3.times do
        3.times do
          play :c5, release: 10
          sleep 5
        end
        1.times do
          play :c6, release: 10, amp: 0.7
          sleep 5
        end
        1.times do
          3.times do
            play :c5, release: 10
            sleep 5
          end
          1.times do
            play :b, release: 10, amp: 0.7
            sleep 20
            sigh
            sleep 20
            
          end
          
        end
        20.times do
          3.times do
            play :c5, release: 10
            sleep bed
            tel = tel +1
            
            
            
          end
          1.times do
            with_fx :reverb do
              if tel ==30 then
                sleep 15
                sigh
                stop
                
              else
                play :b, amp: 0.8, release: 20
                sleep bed
                bed = bed2
                slaap = slaap +1
                
                
              end
              if slaap == 3 then
                bed2 = 3.5
              end
              if slaap == 5 then
                heartbeat
                
                
              end
            end
          end
        end
      end
    end
  end
end











define :inthebeginning do
  live_loop :eng do
    with_fx :reverb do
      with_fx :reverb do
        with_fx :reverb do
          use_synth :piano
          12.times do
            if times == 3 then
              play :c6, amp: 0.7, release: 10
              sleep 5
              times = 0
              
            else
              play :c5 , release: 10
              sleep 5
              times = times +1
            end
          end
          
          4.times do
            if times == 3 then
              play :b, amp: 1.1
              times = 0
              
              
              
              /eden/
              sleep 10
              genesis
              stop
              
            else
              play :c5, release: 10
              sleep speed
              times = times +1
            end
          end
        end
      end
    end
  end
end





/start/
inthebeginning
/eden
sleep 5
genesis/





















