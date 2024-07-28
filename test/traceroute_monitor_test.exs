defmodule TracerouteMonitor.TracerouteContextTest do
  use ExUnit.Case, async: true
  alias TracerouteMonitor.TracerouteContext
  alias TracerouteMonitor.{Category, Host, Traceroute, TracerouteHop, Repo}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})

    category = %Category{name: "Test Category"} |> Repo.insert!()
    host1 = %Host{name: "Host1", ip: "192.168.1.1", address: "Address1", category_id: category.id} |> Repo.insert!()
    host2 = %Host{name: "Host2", ip: "192.168.1.2", address: "Address2", category_id: category.id} |> Repo.insert!()
    host3 = %Host{name: "Google DNS", ip: "8.8.8.8", address: "Google", category_id: category.id} |> Repo.insert!()

    traceroute1 = %Traceroute{host_id: host1.id} |> Repo.insert!()
    traceroute2 = %Traceroute{host_id: host1.id} |> Repo.insert!()
    traceroute3 = %Traceroute{host_id: host3.id} |> Repo.insert!()

    %TracerouteHop{traceroute_id: traceroute1.id, order: 1, host: "192.168.1.1", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()
    %TracerouteHop{traceroute_id: traceroute1.id, order: 2, host: "192.168.1.2", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()

    %TracerouteHop{traceroute_id: traceroute2.id, order: 1, host: "192.168.1.1", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()
    %TracerouteHop{traceroute_id: traceroute2.id, order: 2, host: "192.168.1.2", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()

    %TracerouteHop{traceroute_id: traceroute3.id, order: 1, host: "8.8.8.8", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()
    %TracerouteHop{traceroute_id: traceroute3.id, order: 2, host: "8.8.4.4", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()

    t1 = TracerouteContext.get_traceroute!(traceroute1.id)
    t2 = TracerouteContext.get_traceroute!(traceroute2.id)
    t3 = TracerouteContext.get_traceroute!(traceroute3.id)

    {:ok, traceroute1: t1, traceroute2: t2, traceroute3: t3, host1: host1, host2: host2, host3: host3}
  end

  describe "route_changed?/2" do
    test "returns false when the traceroutes are identical", %{traceroute1: t1, traceroute2: t2} do
      assert TracerouteContext.route_changed?(t1, t2) == false
    end

    test "returns true when the traceroutes are different", %{traceroute1: t1, traceroute2: t2} do
      %TracerouteHop{traceroute_id: t2.id, order: 2, host: "192.168.1.3", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()
      t2_updated = TracerouteContext.get_traceroute!(t2.id)
      assert TracerouteContext.route_changed?(t1, t2_updated) == true
    end

    test "returns true when the route for 8.8.8.8 has changed", %{traceroute3: t3, host3: host3} do
      new_traceroute = %Traceroute{host_id: host3.id} |> Repo.insert!()
      %TracerouteHop{traceroute_id: new_traceroute.id, order: 1, host: "8.8.8.8", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()
      %TracerouteHop{traceroute_id: new_traceroute.id, order: 2, host: "1.1.1.1", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()

      t3_updated = TracerouteContext.get_traceroute!(new_traceroute.id)
      assert TracerouteContext.route_changed?(t3, t3_updated) == true
    end

    test "returns false when the route for 8.8.8.8 is identical", %{traceroute3: t3, host3: host3} do
      new_traceroute = %Traceroute{host_id: host3.id} |> Repo.insert!()
      %TracerouteHop{traceroute_id: new_traceroute.id, order: 1, host: "8.8.8.8", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()
      %TracerouteHop{traceroute_id: new_traceroute.id, order: 2, host: "8.8.4.4", loss: 0.0, snt: 10, avg: 1.0} |> Repo.insert!()

      t3_updated = TracerouteContext.get_traceroute!(new_traceroute.id)
      assert TracerouteContext.route_changed?(t3, t3_updated) == false
    end
  end
end
