class AddCustomerToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :customers, column: :customerID, primary_key: "id"
  end
end
