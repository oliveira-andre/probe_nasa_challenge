class Probe < ActiveRecord::Migration[5.2]
  def change
    create_table :probes do |t|
      t.integer :x_axis
      t.integer :y_axis
    end
  end
end
