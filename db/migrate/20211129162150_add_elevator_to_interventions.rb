class AddElevatorToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :elevators, column: :elevatorID, primary_key: "id"
  end
end
