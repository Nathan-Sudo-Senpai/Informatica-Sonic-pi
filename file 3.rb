Gitaar = "C:/Users/Gebruiker/Documents/Sonic pi/Samples/Gitaar"
Effects = "C:/Users/Gebruiker/Documents/Sonic pi/Samples/Effects"

use_bpm 200
speed = 5
amp_invalGitaar = (ramp *(range 0.2,0.4,0.05))
amp_afvalPiano = (ramp *(range 1,0,-0.05))
amp_afvalPiano2 = (ramp *(range 0.8,0,-0.05))
amp_invalHeartbeat = (ramp *(range 1,2.5,0.0625))
times = 0
bed = 5
bed2 = 4
slaap = 0
a = 0.7
b = 3.5
tel = 0
ukulele = 0

define :sigh do
  sample Effects, "43565-HUMAN_BREATHE_INHALE_SHORT_EXHALE_LONG_01", rate: 0.8
end

define :impact do
  sample Effects, "electronic-impact-hard-10018"
  
end




define :beforeGuitar do
  1.times do
    1.times do
      3.times do
        play :c5, release: 10
        sleep 7.5
      end
      1.times do
        play :b, release: 10, amp: 0.7
        sleep 30
        impact
        guitarBegin
        stop
      end
    end
    
    
    
  end
end



define :guitarBegin do
  
  live_loop :beforeGitaar do
    4.times do
      3.times do
        play :c5, release: 10, amp: amp_afvalPiano.tick
        with_fx :reverb, room: 0.5 do
          sample Gitaar, "overdriven-guitar-single-chord-long-release_A_minor", amp: amp_invalGitaar.tick
        end
        sleep 3.25
      end
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



define :background do
  live_loop :backgroundmusic do
    2.times do
      sample Effects, "radio-static-6382 (mp3cut.net)", rate: 0.32, amp: 0.5
      sample Effects, "temple-cave-myts-storm-6363", amp: 0.1
      sleep 40
    end
    stop
  end
end


define :heartbeat do
  live_loop :heart do
    with_fx :echo, phase: 1, max_phase: 0.5 do
      synth :fm, note: :c1 , amp: amp_invalHeartbeat.tick, pan: a
      sleep bed2
      if a >= 0 then
        a = a - 1.4
      else
        a = a + 1.4
      end
      
      
    end
  end
end

define :genesis do
  
  with_fx :reverb, room: 0.5 do
    use_synth :piano
    1.times do
      /3.times do
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
          sleep 10
          sigh
          sleep 20
          background
        end
      end/
      20.times do
        3.times do
          play :c5, release: 10
          sleep bed
          tel = tel +1
        end
        1.times do
          
          if tel ==27 then
            sleep 15
            sigh
            sleep 15
            beforeGuitar
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
          
        end
        if slaap == 5 then
          heartbeat
        end
      end
    end
  end
end


define :inthebeginning do
  live_loop :eng do
    with_fx :reverb, room: 0.8 do
      use_synth :piano
      12.times do
        if times == 3 then
          play :c6, amp: 0.7, release: 10
          sleep speed
          times = 0
        else
          play :c5 , release: 10
          sleep speed
          times = times +1
        end
      end
      4.times do
        if times == 3 then
          play :b, amp: 1.1
          times = 0
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

/inthebeginning/
genesis
/guitarBegin/