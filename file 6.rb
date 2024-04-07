Effects = "C:/Users/Gebruiker/Downloads/Samples/Effects"
use_bpm 200



/sample :bass_dnb_f/
/sample :perc_swash, rate: 0.1/


/
s = :loop_breakbeat
duration_s = sample_duration(s)
duration = duration_s 4



a=12
18.times do
  sample :loop_breakbeat, num_slices: 18, slice: a
  sleep duration
  a=a+1
end
/
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

machine = 0
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
      
      if k == 22 then
        hart2 = 8
        in_thread do
          heartbeat
        end
      end
      
      
      
      
      if k % 11 == 0 and k >= 43 then
        
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
      sample Effects, "glockenspiel-melody-140bpm-28185", num_slices: 22, slice: k , amp: 0.3
      k= k +1
      if k == 11 then
        sleep 0.1
        
        sleep 3
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






/:prophet/
/use_synth :sc808_clap
play :g5/
/
with_fx :bitcrusher do
  use_synth :
  play :g5 , release: 3
end/
/
1.times do
  in_thread do
    this
  end
  3.times do
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_snare_hard, amp: 0.1
    sleep 2.5
    sample :drum_bass_hard, amp: 0.1
    sleep 2
    sample :drum_bass_hard, amp: 0.1
    sleep 2
  end

  3.times do
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_snare_hard, amp: 0.1
    sleep 2
  end
  sleep 2
  sample :drum_bass_hard, amp: 0.1
  sleep 4
end

define :secondbeat do
  2.times do
    sample :drum_bass_hard, amp: 0.1
    sleep 4
    sample :drum_bass_hard, amp: 0.1
    sleep 0.5
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_snare_hard, amp: 0.1
    sleep 2

    2.times do


      sample :drum_bass_hard, amp: 0.1
      sleep 1
      sample :drum_bass_hard, amp: 0.1
      sleep 1
      sample :drum_snare_hard, amp: 0.1
      sleep 2.2


    end
  end
end
/

define :headbeat do
  with_fx :reverb do
    1.times do
      sample :drum_bass_hard, amp: 0.1
      sleep 1
      sample :drum_bass_hard, amp: 0.1
      sleep 1
      sample :drum_snare_hard, amp: 0.1
      sleep 4
      
      secondbeat
      
    end
  end
end



/live_loop :basicbeat do
  headbeat
end/

/sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_bass_hard, amp: 0.1
    sleep 1
    sample :drum_snare_hard, amp: 0.1
    sleep 2/




























/speed = 0.75
40.times do
  sample :bd_808, amp: 0.7
  sleep speed
  sample :drum_bass_soft, amp: 0.3, rate: 0.9
  sleep speed
  sample :drum_bass_soft, amp: 0.7
  sleep speed
  sample :drum_bass_soft, amp: 0.3
  sleep speed
  sample :drum_bass_soft, amp: 0.7
  sleep speed
  sample :drum_bass_hard, amp: 0.3
  sleep speed
  sample :bd_808, amp: 0.7
  sleep speed
  sample :drum_bass_soft, amp: 0.7
  sleep speed
  sample :drum_bass_soft, amp: 0.3, rate: 0.9
  sleep speed
  sample :drum_bass_soft, amp: 0.7
  sleep speed
  sample :drum_bass_soft, amp: 0.3
  sleep speed
  sample :sn_dolf, amp: 0.2
  sleep speed




end
/

/live_loop :bildad do
    sample Effects, "electronic-impact-hard-10018",beat_stretch: 6, rate: 0.2
    sleep 5
  end/


