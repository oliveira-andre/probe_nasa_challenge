module ProbeMoviments
  extend ActiveSupport::Concern

  def turn_around(spin)
    probe = Probe.last
    probe.update(direction: "C") if probe.direction == "D" && spin == "GE"
    probe.update(direction: "B") if probe.direction == "D" && spin == "GD"
    probe.update(direction: "E") if probe.direction == "C" && spin == "GE"
    probe.update(direction: "D") if probe.direction == "C" && spin == "GD"
    probe.update(direction: "B") if probe.direction == "E" && spin == "GE"
    probe.update(direction: "C") if probe.direction == "E" && spin == "GD"
    probe.update(direction: "D") if probe.direction == "B" && spin == "GE"
    probe.update(direction: "E") if probe.direction == "B" && spin == "GD"
  end

  def move
    probe = Probe.last
    probe.update(x: probe.x - 1) if probe.direction == "E"
    probe.update(x: probe.x + 1) if probe.direction == "D"
    probe.update(y: probe.y - 1) if probe.direction == "B"
    probe.update(y: probe.y + 1) if probe.direction == "C"
  end

end