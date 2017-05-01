defmodule ShipDesigner.Design do
  use ShipDesigner.Web, :model

  alias ShipDesigner.Repo

  schema "designs" do
    field :name, :string
    field :description, :string

    belongs_to :ship, ShipDesigner.Ship
    many_to_many :modules, ShipDesigner.Module, join_through: "designs_modules"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> Repo.preload(:ship)
    |> cast(params, [:name, :description])
    |> cast_assoc(:ship)
    |> validate_required([:name, :ship])
  end
end
