defmodule ShipDesigner.Repo.Migrations.AddOriginalColumnToModulesTable do
  use Ecto.Migration

  def change do
    alter table(:modules) do
      add :details, :map
    end
  end
end
