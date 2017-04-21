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
  def insert_module(record) do
    changeset = ShipDesigner.Module.changeset(%ShipDesigner.Module{}, %{
      name: record["group"]["name"],
      category: record["group"]["category"],
      class: record["class"],
      rating: record["rating"],
      price: record["price"],
      mass: record["mass"],
      power_draw: record["power_draw"]
    })

    ShipDesigner.Repo.insert!(changeset)
  end
end

{_, 0} = System.cmd("curl", ["-o", "priv/repo/modules.json", "https://eddb.io/archive/v5/modules.json"])

"priv/repo/modules.json"
|> File.read!
|> Poison.Parser.parse!
|> Enum.each(&Seeds.insert_module/1)
