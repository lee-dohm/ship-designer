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

  @seconds_in_a_day 86_400

  def insert_module(record) do
    changeset = Module.changeset(%Module{}, to_module(record))

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
      original: record
    }
  end
end

Seeds.refresh("priv/repo/modules.json", "https://eddb.io/archive/v5/modules.json")

"priv/repo/modules.json"
|> File.read!
|> Poison.Parser.parse!
|> Enum.each(&Seeds.insert_module/1)
