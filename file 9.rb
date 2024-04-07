use_bpm 200

a= (ramp *(range 0.1,0.5,0.1))

live_loop :background do
  with_fx :panslicer, phase: 0.5,res: 0.5,amp: 2,mix: 0.8 do
    synth :fm,note: hz_to_midi(80)  ,release: 20, amp: a.tick
    sleep 4
    synth :fm,note: hz_to_midi(82)  ,release: 20, amp: a.tick
    sleep 4
  end
end



yo = (ramp *(range 0,0.5,0.05))
yoreverse = (ramp *(range 1,11,1))
Effects = "C:/Users/Gebruiker/Documents/Sonic pi/Samples/Effects"
use_bpm 200


10.times do
  sample Effects, "braam-6150", 11, slice: yoreverse.tick
  sleep 1
end