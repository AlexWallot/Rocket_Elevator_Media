class AddEmployeeToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :employees, column: :employeeID, primary_key: "id"
  end
end
