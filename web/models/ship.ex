defmodule ShipDesigner.Ship do
  use ShipDesigner.Web, :model

  schema "ships" do
    field :name, :string
    field :manufacturer, :string
    field :length, :float
    field :width, :float
    field :height, :float
    field :type, :string
    field :price, :integer
    field :top_speed, :integer
    field :boost_speed, :integer
    field :maneuverability, :integer
    field :shields, :integer
    field :armor, :integer
    field :hull_mass, :integer
    field :pad_size, :string
    field :mass_lock, :integer
    field :hardpoints, :map
    field :internals, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
         :name,
         :manufacturer,
         :length,
         :width,
         :height,
         :type,
         :price,
         :top_speed,
         :boost_speed,
         :maneuverability,
         :shields,
         :armor,
         :hull_mass,
         :pad_size,
         :mass_lock,
         :hardpoints,
         :internals
       ])
    |> validate_required([
         :name,
         :manufacturer,
         :length,
         :width,
         :height,
         :type,
         :price,
         :top_speed,
         :boost_speed,
         :maneuverability,
         :shields,
         :armor,
         :hull_mass,
         :pad_size,
         :mass_lock,
         :hardpoints,
         :internals
       ])
  end
end
