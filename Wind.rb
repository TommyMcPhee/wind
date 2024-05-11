# Welcome to Sonic Pi
use_random_seed 101

in_thread do
  loop do
    z = rrand(0,3)
    a = z * z
    b = a/((a+1)*(a+1))
    c = a - b
    d = rrand(0,1)
    e = rrand(0,120)
    f = rrand(0,1)
    g = 1 - d
    h = 1 - e
    i = 1 - f
    j = ((2 - g - i)/2)*131
    k = (2 - d - f)/2
    with_fx :rbpf, mix: d, centre: e, res: f do
      with_fx :rhpf, mix: g, centre: h, res: i do
        use_synth (ring :noise).choose
        play h, cutoff: j, res: k, attack: b, decay: c, sustain_level: 0, sustain: 0, release: 0
        sleep a
      end
    end
  end
end