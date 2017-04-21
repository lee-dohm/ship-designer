defmodule ShipDesigner.Module do
  use ShipDesigner.Web, :model

  schema "modules" do
    field :name, :string
    field :category, :string
    field :class, :integer
    field :rating, :string
    field :price, :integer
    field :mass, :float
    field :power_draw, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :category, :class, :rating, :price, :mass, :power_draw])
    |> validate_required([:name, :category, :class, :rating])
    |> validate_number(:class, greater_than_or_equal_to: 0, less_than: 10)
    |> validate_number(:price, greater_than_or_equal_to: 0)
    |> validate_format(:rating, ~r/[A-Z]/)
  end
end
