use_bpm 200

Effects = "C:/Users/Gebruiker/Downloads/Samples/Effects"

stuk = 0





define :violin do
  sound = (range 0.5,0,-0.0625)
  violin = Effects,"violin_sharp_luckyclover_edited-85650"
  duration_violin = sample_duration(violin)
  durationViolin = duration_violin / 10
  
  4.times do
    sample Effects, "violin_sharp_luckyclover_edited-85650", num_slices: 10 , slice: stuk , amp: 1 ,rate: 0.1
    stuk = stuk +1
    sleep durationViolin
  end
  
end

violin