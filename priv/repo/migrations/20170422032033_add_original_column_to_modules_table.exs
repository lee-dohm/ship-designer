defmodule ShipDesigner.Repo.Migrations.AddOriginalColumnToModulesTable do
  use Ecto.Migration

  def change do
    alter table(:modules) do
      add :original, :text
    end
  end
end