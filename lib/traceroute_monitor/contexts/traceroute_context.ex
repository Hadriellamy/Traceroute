defmodule TracerouteMonitor.TracerouteContext do
  import Ecto.Query, warn: false
  alias TracerouteMonitor.Repo
  alias TracerouteMonitor.{Category, Host, Traceroute, TracerouteHop}

  def list_categories do
    Repo.all(Category) |> Repo.preload(:hosts)
  end

  def get_category!(id), do: Repo.get!(Category, id) |> Repo.preload(:hosts)

  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)\

    |> Repo.update()
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def list_hosts do
    Repo.all(Host) |> Repo.preload(:category)
  end

  def get_host!(id), do: Repo.get!(Host, id) |> Repo.preload(:category)

  def create_host(attrs \\ %{}) do
    %Host{}
    |> Host.changeset(attrs)
    |> Repo.insert()
  end

  def update_host(%Host{} = host, attrs) do
    host
    |> Host.changeset(attrs)
    |> Repo.update()
  end

  def delete_host(%Host{} = host) do
    Repo.delete(host)
  end

  def list_traceroutes do
    Repo.all(Traceroute) |> Repo.preload([:host, :traceroutes_hops])
  end

  def get_traceroute!(id), do: Repo.get!(Traceroute, id) |> Repo.preload([:host, :traceroutes_hops])

  def create_traceroute(attrs \\ %{}) do
    %Traceroute{}
    |> Traceroute.changeset(attrs)
    |> Repo.insert()
  end

  def update_traceroute(%Traceroute{} = traceroute, attrs) do
    traceroute
    |> Traceroute.changeset(attrs)
    |> Repo.update()
  end

  def delete_traceroute(%Traceroute{} = traceroute) do
    Repo.delete(traceroute)
  end

  def list_traceroutes_hops do
    Repo.all(TracerouteHop) |> Repo.preload(:traceroute)
  end

  def get_traceroute_hop!(id), do: Repo.get!(TracerouteHop, id) |> Repo.preload(:traceroute)

  def create_traceroute_hop(attrs \\ %{}) do
    %TracerouteHop{}
    |> TracerouteHop.changeset(attrs)
    |> Repo.insert()
  end

  def update_traceroute_hop(%TracerouteHop{} = traceroute_hop, attrs) do
    traceroute_hop
    |> TracerouteHop.changeset(attrs)
    |> Repo.update()
  end

  def delete_traceroute_hop(%TracerouteHop{} = traceroute_hop) do
    Repo.delete(traceroute_hop)
  end

  def same_traceroutes?(traceroute1, traceroute2) do
    traceroute1.host_id == traceroute2.host_id &&
      traceroute1.created_at == traceroute2.created_at
  end

  @doc """
  Vérifie si la route a changé en comparant les hops des deux traceroutes.
  """
  def route_changed?(traceroute1, traceroute2) do
    traceroute1 = Repo.preload(traceroute1, :traceroutes_hops)
    traceroute2 = Repo.preload(traceroute2, :traceroutes_hops)
    compare_hops(traceroute1.traceroutes_hops, traceroute2.traceroutes_hops)
  end

  defp compare_hops([], []), do: false
  defp compare_hops([hop1 | rest1], [hop2 | rest2]) do
    if hop1.host != hop2.host or hop1.order != hop2.order do
      true
    else
      compare_hops(rest1, rest2)
    end
  end
  defp compare_hops(_, _), do: true
end
