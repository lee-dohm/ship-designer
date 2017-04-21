defmodule ShipDesigner.Repo.Migrations.CreateModule do
  use Ecto.Migration

  def change do
    create table(:modules, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :category, :string
      add :class, :integer
      add :rating, :string
      add :price, :integer
      add :mass, :float
      add :power_draw, :float

      timestamps()
    end

  end
end
