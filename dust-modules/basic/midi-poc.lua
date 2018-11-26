engine.name = 'PolyPerc'

function init()
end

local m = midi.connect()
m.event = function(data)
  d = midi.to_msg(data)
  tab.print(d)
  if d.type == "note_on" then
    engine.amp(d.vel / 127)
    engine.hz((440 / 32) * (2 ^ ((d.note - 9) / 12)))
    engine.release(10)
    engine.pw(math.random(200)/100)
  end
end
