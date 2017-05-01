defmodule ShipDesigner.Repo.Migrations.CreateDesign do
  use Ecto.Migration

  def change do
    create table(:designs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :ship_id, references(:ships, type: :binary_id)

      timestamps()
    end

    create table(:designs_modules, primary_key: false) do
      add :design_id, references(:designs, type: :binary_id)
      add :module_id, references(:modules, type: :binary_id)
    end
  end
end
