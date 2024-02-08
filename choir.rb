gitaar = "C:/Users/natha/Samples/Gitaar"
piano = "C:/Users/natha/Samples/piano"
voice = "C:/Users/natha/Samples/voice"


r=2
use_bpm 200

/(2.times do :master
   4.times do :solenoid1

     sample gitaar, "Korg-M3R-Rock-Mutes-C3", beat_stretch: r, amp: 2
     sleep 1
     sample gitaar, "Korg-M3R-Rock-Mutes-C3", beat_stretch: r + 2, amp: 2
     sleep 1
     sample gitaar, "Korg-M3R-Rock-Mutes-C3", beat_stretch: r + 1 , amp: 2
     sleep 1
     r = r+1
   end
   r=2
end)

4.times do :master2
  4.times do
    sample gitaar,"Alesis-Fusion-Clean-Guitar-C3",beat_stretch: 9, amp: 2, rate: 0.3
    sleep 1
  end
  4.times do

    sample piano, "Alesis-Fusion-Honky-Tonk-Piano-C5", beat_stretch: 3, amp: 2, rate:0.3
    sleep 1
  end
end/


1.times do :master3
  2.times  do
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", amp: 2, rate: 0.4
    sleep 5
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", amp: 2, rate: 0.4
    sleep 1
  end
  2.times do
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", amp: 2, rate: 0.4
    sleep 5
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", amp: 2, rate: 0.4
    sleep 1
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", beat_stretch: 5, amp: 2, rate: 0.4
    sleep 1
  end
  1.times do
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", amp: 2, rate: 0.4
    sleep 5
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", amp: 2, rate: 0.4
    sleep 1
    sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", beat_stretch: 5, amp: 1, rate: 0.6
    2.times do
      sample voice, "Alesis-Sanctuary-QCard-Choir-Ooh-C4", beat_stretch: 5, amp: 1, rate: 0.4
      sleep 1
    end
    
  end
end











































