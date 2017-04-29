defmodule ShipDesigner.Repo.Migrations.AddCoreComponentsToShipsTable do
  use Ecto.Migration

  def change do
    alter table(:ships) do
      add :power_plant_size, :integer
      add :thruster_size, :integer
      add :fsd_size, :integer
      add :life_support_size, :integer
      add :power_distributor_size, :integer
      add :sensor_size, :integer
      add :fuel_tank_size, :integer
    end
  end
end
