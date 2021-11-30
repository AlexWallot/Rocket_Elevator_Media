class AddColumnToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :columns, column: :columnID, primary_key: "id"
  end
end
