defmodule ShipDesigner.FormatHelpers.Test do
  use ExUnit.Case, async: true

  alias ShipDesigner.FormatHelpers

  test "format_distance returns a string representation of the number" do
    assert FormatHelpers.format_distance(12.3) == "12.3"
  end

  test "format_distance returns an empty string when given nil without asking for units" do
    assert FormatHelpers.format_distance(nil) == ""
  end

  test "format_distance returns a string representation of the number and units" do
    assert FormatHelpers.format_distance(12.3, :with_unit) == "12.3 km"
  end

  test "format_distance returns zero when given nil and asked for units" do
    assert FormatHelpers.format_distance(nil, :with_unit) == "0 km"
  end

  test "format_mass returns a string representation of the number" do
    assert FormatHelpers.format_mass(15) == "15"
  end

  test "format_mass returns an empty string when given nil without asking for units" do
    assert FormatHelpers.format_mass(nil) == ""
  end

  test "format_mass returns a string representation of the number and units" do
    assert FormatHelpers.format_mass(15, :with_unit) == "15 T"
  end

  test "format_mass returns zero when given nil and asked for units" do
    assert FormatHelpers.format_mass(nil, :with_unit) == "0 T"
  end

  test "format_money returns a string representation of the number" do
    assert FormatHelpers.format_money(15_000) == "15,000"
  end

  test "format_money returns an empty string when given nil without asking for units" do
    assert FormatHelpers.format_money(nil) == ""
  end

  test "format_money returns a string representation of the number and units" do
    assert FormatHelpers.format_money(15_000, :with_unit) == "15,000 CR"
  end

  test "format_money returns zero when given nil and asked for units" do
    assert FormatHelpers.format_money(nil, :with_unit) == "0 CR"
  end

  test "format_power returns a string representation of the number" do
    assert FormatHelpers.format_power(115) == "115"
  end

  test "format_power returns an empty string when given nil and not asked for units" do
    assert FormatHelpers.format_power(nil) == ""
  end

  test "format_power returns a string representation of the number and units" do
    assert FormatHelpers.format_power(115, :with_unit) == "115 MW"
  end

  test "format_power returns zero when given nil and asked for units" do
    assert FormatHelpers.format_power(nil, :with_unit) == "0 MW"
  end
end
