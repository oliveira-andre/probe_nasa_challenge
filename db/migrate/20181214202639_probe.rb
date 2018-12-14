class Probe < ActiveRecord::Migration[5.2]
  def change
    create_table :probes do |t|
      t.integer :x_axis, default: 0
      t.integer :y_axis, default: 0
      t.string  :direction, default: "D"
    end
  end
end
