use_bpm 220

Effects = "C:/Users/Gebruiker/Downloads/Samples/Effects"


a = 0.7
hart = 4
hart2 = 3


define :heartbeat do
  hart.times do
    with_fx :echo, phase: 1, max_phase: 0.5 do
      synth :fm, note: :c1 , amp: 1, pan: a
      sleep 6
      if a >= 0 then
        a = a - 1.4
      else
        a = a + 1.4
      end
      
      
    end
  end
  volgende
end

define :heartbeat2 do
  hart2.times do
    with_fx :echo, phase: 1, max_phase: 0.5 do
      synth :fm, note: :c1 , amp: 1, pan: a
      sleep 6
      if a >= 0 then
        a = a - 1.4
      else
        a = a + 1.4
      end
      
      
    end
  end
end







spiel = Effects,"glockenspiel-melody-140bpm-28185"
duration_spiel = sample_duration(spiel)/22

slaap = sample_duration(spiel)/8
slaap_bell = sample_duration(spiel)/4




duration_bells = sample_duration(spiel)/2


bel = 0

live_loop :churchbells do
  sync "churchbells"
  
  
  if bel > 0  then
    sleep 2
  end
  
  sample Effects, "old-church-bell-6298", amp: 0.3
  
  bel = 1
  important = 0.3
  
  
end


important = 0.3

l = 0


live_loop :shredding do
  sync "riff"
  
  sample Effects, "e-guitar-riff-94670", num_slices: 16, slice: 0, amp: important
  sleep 1
  sample Effects, "e-guitar-riff-94670", num_slices: 16, slice: 0, amp: important
  
  if l >= 2 then
    cue "second_this"
    
  end
  l = l + 1
  
  
  
end


live_loop :second_this do
  sync "second_this"
  
  sample :drum_bass_hard, amp: important
  sleep 1
  sample :drum_snare_hard, amp: important
  
  
end

machine = 1
pistool = 0.1
belangrijk = 1
live_loop :third_this do
  sync "tussen_beat"
  sleep 0.35
  with_fx :reverb do
    use_synth :piano
    sample Effects, "9mm-pistol-shot-6349", amp: pistool
    sleep 0.80
    sample Effects, "9mm-pistol-shot-6349", amp: pistool
    sleep 0.80
    sample Effects, "9mm-pistol-shot-6349", amp: pistool
    sleep 1.3
    sample Effects, "9mm-pistol-shot-6349", amp: pistool
    pistool = 0
  end
  
  machine = machine + 1
  if machine == 4 then
    sleep 0.2
    sample Effects, "machine-gun-129928", rate: 0.5
  end
  
  
end



define :before_this do
  2.times do
    sleep 1
    sample :drum_bass_hard, amp: 0.5
    sleep 1
    sample :drum_bass_hard, amp: 0.5
    sleep duration_spiel*11-1
  end
  
end


live_loop :this do
  
  sync "beast"
  1.times do
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 4
    
    
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample Effects, "snare-made-from-clap-101249", amp: 0.2
    sleep 3
    
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 4
    
    sample :drum_bass_hard, amp: 0.1
    sleep 0.5
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample Effects, "snare-made-from-clap-101249", amp: 0.2
    sleep 1
    
    
    
  end
  
  
  
end



import = 0
define :glockenbeat do
  
  k = 0
  
  in_thread do
    before_this
  end
  
  sleep 1
  4.times do#
    
    22.times do
      
      
      sample Effects, "glockenspiel-melody-140bpm-28185", num_slices: 22, slice: k, amp: important
      if k % 11 == 0 then
        sleep 0.1
        cue "riff"
        
      end
      
      if k % 11 == 2 and k >= 22 then
        cue "beast"
      end
      
      
      
      
      if k % 11 == 8 and k > 22 then
        cue "tussen_beat"
      end
      
      
      if k == 43 then
        important = 0
        belangrijk = 0
      end
      
      if k == 44 then #54
        important = 0.3
        belangrijk = 1
      end
      
      if k == 22 or k == 44 then
        hart2 = 4
        in_thread do
          heartbeat2
        end
      end
      
      
      if k % 11 == 0 and k >= 44 then
        
        cue "churchbells"
        
        
        
      end
      
      
      print k
      sleep duration_spiel
      k= k +1
    end
    
  end
  einde
  
  
end


define :glockenspiel do
  
  spiel = Effects,"glockenspiel-melody-140bpm-28185"
  duration_spiel = sample_duration(spiel)/22
  
  
  
  k = 0
  with_fx :reverb do
    11.times do
      sample Effects, "glockenspiel-melody-140bpm-28185", num_slices: 22, slice: k , amp: 0.3, release: 3
      k= k +1
      if k == 11 then
        sleep 2
        in_thread do
          heartbeat2
        end
        
        sleep 18
        sample Effects, "woosh_low_long01-98755"
        
        glockenbeat
      else
        
        sleep duration_spiel
      end
    end
    
  end
  
end











define :einde do
  
  spiel = Effects,"glockenspiel-melody-140bpm-28185"
  duration_spiel = sample_duration(spiel)/11
  
  
  p = 0
  with_fx :reverb do
    11.times do
      sample Effects, "glockenspiel-melody-140bpm-28185", num_slices: 22, slice: p , amp: 0.5, rate: 0.5
      p = p +1
      
      
      sleep duration_spiel
      
    end
    
  end
end












define :violin do
  stuk = 0
  sound = (range 0.2,0,-0.0625)
  violin = Effects,"violin_sharp_luckyclover_edited-85650"
  duration_violin = sample_duration(violin)
  durationViolin = duration_violin / 5
  
  4.times do
    sample Effects, "violin_sharp_luckyclover_edited-85650", num_slices: 10 , slice: stuk , amp: 0.2, rate: 0.5
    stuk = stuk +1
    sleep durationViolin
  end
  6.times do
    sample Effects, "violin_sharp_luckyclover_edited-85650", num_slices: 20 , slice: 8, amp: sound.tick, rate: 0.5
    sleep durationViolin/2
  end
end




pianoTimer = 18.5

define :piano_volgende do
  4.times do
    with_fx :reverb do
      
      sample Effects, "glockenspiel-melody-140bpm-28185", num_slices: 22, slice: 0 , amp: 0.5, rate: 0.5
      sleep pianoTimer
      
    end
  end
end




define :volgende do
  in_thread do
    piano_volgende
  end
  x = 0.3
  sleep 4
  with_fx :reverb do
    1.times do#
      2.times do
        sample :drum_bass_hard, amp: 0.2
        sleep 1
        sample :drum_bass_hard, amp: 0.2
        sleep 12
        sample Effects, "violin_sharp_luckyclover_edited-85650", rate: x, amp: 0.05
        sleep 4
        x = 0.2
      end
      
      
      sleep 4
      sample :drum_bass_hard, amp: 0.2
      sleep 0.5
      sample :drum_bass_hard, amp: 0.2
      sleep 1
      sample :drum_bass_hard, amp: 0.2
      sleep 3
      sample :drum_bass_hard, amp: 0.2
      sleep 4
      in_thread do
        violin
      end
      
      sleep 20
      
      
    end
    glockenspiel
    
  end
  
end





s = Effects,"world-war-1-trench-warfare-battlefield-sounds-6744"
duration_s = sample_duration(s)
duration = duration_s / 100
deel = 0
geluid = 0.2

define :war do
  100.times do
    sample s, amp: geluid, num_slices: 100, slice: deel
    deel = deel + 1
    if deel == 24
      in_thread do
        piano
      end
      sleep duration
    else
      sleep duration
    end
  end
end

define :piano do
  4.times do
    geluid = geluid - 0.0425
    sleep duration
  end
  geluid = 0.03
  sleep 3*duration
  with_fx :reverb do
    with_synth :piano do
      play 86, sustain: 1, release: 3
      sleep 3
      play 89, sustain: 1, release: 3, amp: 0.4
      sleep 12
      
      play 86, sustain: 1, release: 3
      sleep 3
      play 89, sustain: 1, release: 3, amp: 0.4
      sleep 12
      
      play 83, sustain: 1, release: 3
      sleep 3
      play 89, sustain: 1, release: 3, amp: 0.5
      sleep 12
      
      play 83, sustain: 1, release: 3
      sleep 3
      play 89, sustain: 1, release: 3, amp: 0.5
      
      
      3.times do
        geluid = geluid - 0.0075
        sleep duration
      end
      
      sleep 6 - 3*duration
      play 91, sustain: 1, release: 3, amp: 0.5
      sleep 3
      play 93, sustain: 1, release: 3, amp: 0.5
      sleep 6
      
      play 91, sustain: 1, release: 3, amp: 0.5
      sleep 3
      play 93, sustain: 1, release: 3, amp: 0.5
      sleep 6
      
      play 83, sustain: 1, release: 3
      sleep 3
      play 89, sustain: 1, release: 3, amp: 0.5
      sleep 6
      play 83, sustain: 1, release: 3
      sleep 3
      play 89, sustain: 1, release: 3, amp: 0.5
      sleep 9
      geluid = 0
      sample Effects, "9mm-pistol-shot-6349", amp: 0.5
      sleep 6
      
      sample :misc_cineboom, rate: 0.4, num_slices: 5, slice: 0, amp: 1.5
      sleep 18
      
      
      
      
    end
  end
  
  in_thread do
    heartbeat
  end
  sleep 3
  sample Effects, "old-church-bell-6298", amp: 0.3
  sleep 7
  sample Effects, "old-church-bell-6298", amp: 0.3
  sleep 7
  sample Effects, "old-church-bell-6298", amp: 0.3
end


war



/sample :guit_e_fifths, num_slices: 13, slice: 0/

/ sample :misc_crow/


#gebruik dit voor inval beat

/4.times do
  sample :misc_cineboom, rate: 0.5, num_slices: 5, slice: 0
  sleep 50
end/




