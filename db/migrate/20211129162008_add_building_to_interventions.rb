class AddBuildingToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :buildings, column: :buildingID, primary_key: "id"
  end
end
