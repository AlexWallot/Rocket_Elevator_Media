class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author, null: false
      t.bigint :customerID, null: false
      t.bigint :buildingID, null: false
      t.bigint :batteryID, null: false
      t.bigint :columnID
      t.bigint :elevatorID
      t.integer :employeeID
      t.datetime :dateAndTimeInterventionStart
      t.datetime :dateAndTimeInterventionEnd
      t.string :result
      t.string :report, null: false
      t.string :status
    end
  end
end
