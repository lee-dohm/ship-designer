defmodule ShipDesigner.ShipTest do
  use ShipDesigner.ModelCase

  alias ShipDesigner.Ship

  @valid_attrs %{armor: 42, boost_speed: 42, height: "120.5", hull_mass: 42, length: "120.5", maneuverability: 42, manufacturer: "some content", mass_lock: 42, name: "some content", pad_size: "some content", price: 42, shields: 42, top_speed: 42, type: "some content", width: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ship.changeset(%Ship{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ship.changeset(%Ship{}, @invalid_attrs)
    refute changeset.valid?
  end
end
