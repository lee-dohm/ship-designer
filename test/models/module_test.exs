defmodule ShipDesigner.ModuleTest do
  use ShipDesigner.ModelCase

  alias ShipDesigner.Module

  @valid_attrs %{category: "some content", class: 42, mass: "120.5", name: "some content", power_draw: "120.5", price: 42, rating: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Module.changeset(%Module{}, @valid_attrs)

    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Module.changeset(%Module{}, @invalid_attrs)

    refute changeset.valid?
  end

  test "allows nil mass" do
    changeset = Module.changeset(%Module{}, %{@valid_attrs | mass: nil})

    assert changeset.valid?
  end

  test "allows nil price" do
    changeset = Module.changeset(%Module{}, %{@valid_attrs | price: nil})

    assert changeset.valid?
  end

  test "allows nil power_draw" do
    changeset = Module.changeset(%Module{}, %{@valid_attrs | power_draw: nil})

    assert changeset.valid?
  end
end
