class AddBatteryToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :batteries, column: :batteryID, primary_key: "id"
  end
end
