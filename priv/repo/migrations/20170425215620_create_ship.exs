defmodule ShipDesigner.Repo.Migrations.CreateShip do
  use Ecto.Migration

  def change do
    create table(:ships, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :manufacturer, :string
      add :length, :float
      add :width, :float
      add :height, :float
      add :type, :string
      add :price, :integer
      add :top_speed, :integer
      add :boost_speed, :integer
      add :maneuverability, :integer
      add :shields, :integer
      add :armor, :integer
      add :hull_mass, :integer
      add :pad_size, :string
      add :mass_lock, :integer

      timestamps()
    end

  end
end
