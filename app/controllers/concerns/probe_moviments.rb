module ProbeMoviments
  extend ActiveSupport::Concern

  def turn_around(spin)
    probe = Probe.last
    times = 0
    probe.update(direction: "C") if probe.direction == "D" && spin == "GE" && times.zero?
    times += 1
    probe.update(direction: "B") if probe.direction == "D" && spin == "GD" && times.zero?
    times += 1
    probe.update(direction: "E") if probe.direction == "C" && spin == "GE" && times.zero?
    times += 1
    probe.update(direction: "D") if probe.direction == "C" && spin == "GD" && times.zero?
    times += 1
    probe.update(direction: "B") if probe.direction == "E" && spin == "GE" && times.zero?
    times += 1
    probe.update(direction: "C") if probe.direction == "E" && spin == "GD" && times.zero?
    times += 1
    probe.update(direction: "D") if probe.direction == "B" && spin == "GE" && times.zero?
    times += 1
    probe.update(direction: "E") if probe.direction == "B" && spin == "GD" && times.zero
    times += 1
  end

  def move
    probe = Probe.last
    probe.update(x_axis: probe.x_axis - 1) if probe.direction == "E"
    probe.update(x_axis: probe.x_axis + 1) if probe.direction == "D"
    probe.update(y_axis: probe.y_axis - 1) if probe.direction == "B"
    probe.update(y_axis: probe.y_axis + 1) if probe.direction == "C"
  end

  def valid_moviments(moviment)
    error = true unless moviment == "GE" || moviment == "GD" || moviment == "M"
    error
  end

end