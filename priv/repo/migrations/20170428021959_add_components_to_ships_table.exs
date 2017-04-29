defmodule ShipDesigner.Repo.Migrations.AddComponentsToShipsTable do
  use Ecto.Migration

  def change do
    alter table(:ships) do
      add :hardpoints, :map
      add :internals, :map
    end
  end
end
