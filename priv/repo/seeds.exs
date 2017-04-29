# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ShipDesigner.Repo.insert!(%ShipDesigner.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds do
  alias ShipDesigner.Module
  alias ShipDesigner.Repo
  alias ShipDesigner.Ship

  @seconds_in_a_day 86_400

  def insert_module(record) do
    changeset = Module.changeset(%Module{}, to_module(record))

    Repo.insert!(changeset)
  end

  def insert_ship(record) do
    changeset = Ship.changeset(%Ship{}, to_ship(record))

    Repo.insert!(changeset)
  end

  def refresh(path, url), do: refresh(path, url, file_age(path))

  defp file_age(path) do
    case File.lstat(path, time: :posix) do
      {:ok, %{mtime: modified_time}} -> DateTime.to_unix(DateTime.utc_now()) - modified_time
      {:error, _} -> @seconds_in_a_day + 1
    end
  end

  defp refresh(path, url, age) when age > @seconds_in_a_day do
    {_, 0} = System.cmd("curl", ["-o", path, url])

    :ok
  end

  defp refresh(_, _, _), do: nil

  defp to_module(record) do
    %{
      name: record["group"]["name"],
      category: record["group"]["category"],
      class: record["class"],
      rating: record["rating"],
      price: record["price"],
      mass: record["mass"],
      power_draw: record["power"],
      details: record
    }
  end

  defp to_ship(record) do
    %{
      name: record["name"],
      manufacturer: record["manufacturer"],
      length: record["length"],
      width: record["width"],
      height: record["height"],
      type: record["type"],
      price: record["price"],
      top_speed: record["top_speed"],
      boost_speed: record["boost_speed"],
      maneuverability: record["maneuverability"],
      shields: record["shields"],
      armor: record["armor"],
      hull_mass: record["hull_mass"],
      pad_size: record["pad_size"],
      mass_lock: record["mass_lock"],
      hardpoints: record["hardpoints"],
      internals: record["internals"]
    }
  end
end

Seeds.refresh("priv/repo/modules.json", "https://eddb.io/archive/v5/modules.json")

"priv/repo/modules.json"
|> File.read!
|> Poison.Parser.parse!
|> Enum.each(&Seeds.insert_module/1)

"priv/repo/ships.json"
|> File.read!
|> Poison.Parser.parse!
|> Enum.each(&Seeds.insert_ship/1)
