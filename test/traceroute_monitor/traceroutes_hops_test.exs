defmodule TracerouteMonitor.TraceroutesHopsTest do
  use TracerouteMonitor.DataCase

  alias TracerouteMonitor.TraceroutesHops

  describe "traceroutes_hops" do
    alias TracerouteMonitor.TraceroutesHops.TraceroutesHop

    import TracerouteMonitor.TraceroutesHopsFixtures

    @invalid_attrs %{host: nil, order: nil, loss: nil, snt: nil, avg: nil}

    test "list_traceroutes_hops/0 returns all traceroutes_hops" do
      traceroutes_hop = traceroutes_hop_fixture()
      assert TraceroutesHops.list_traceroutes_hops() == [traceroutes_hop]
    end

    test "get_traceroutes_hop!/1 returns the traceroutes_hop with given id" do
      traceroutes_hop = traceroutes_hop_fixture()
      assert TraceroutesHops.get_traceroutes_hop!(traceroutes_hop.id) == traceroutes_hop
    end

    test "create_traceroutes_hop/1 with valid data creates a traceroutes_hop" do
      valid_attrs = %{host: "some host", order: 42, loss: 120.5, snt: 42, avg: 120.5}

      assert {:ok, %TraceroutesHop{} = traceroutes_hop} = TraceroutesHops.create_traceroutes_hop(valid_attrs)
      assert traceroutes_hop.host == "some host"
      assert traceroutes_hop.order == 42
      assert traceroutes_hop.loss == 120.5
      assert traceroutes_hop.snt == 42
      assert traceroutes_hop.avg == 120.5
    end

    test "create_traceroutes_hop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TraceroutesHops.create_traceroutes_hop(@invalid_attrs)
    end

    test "update_traceroutes_hop/2 with valid data updates the traceroutes_hop" do
      traceroutes_hop = traceroutes_hop_fixture()
      update_attrs = %{host: "some updated host", order: 43, loss: 456.7, snt: 43, avg: 456.7}

      assert {:ok, %TraceroutesHop{} = traceroutes_hop} = TraceroutesHops.update_traceroutes_hop(traceroutes_hop, update_attrs)
      assert traceroutes_hop.host == "some updated host"
      assert traceroutes_hop.order == 43
      assert traceroutes_hop.loss == 456.7
      assert traceroutes_hop.snt == 43
      assert traceroutes_hop.avg == 456.7
    end

    test "update_traceroutes_hop/2 with invalid data returns error changeset" do
      traceroutes_hop = traceroutes_hop_fixture()
      assert {:error, %Ecto.Changeset{}} = TraceroutesHops.update_traceroutes_hop(traceroutes_hop, @invalid_attrs)
      assert traceroutes_hop == TraceroutesHops.get_traceroutes_hop!(traceroutes_hop.id)
    end

    test "delete_traceroutes_hop/1 deletes the traceroutes_hop" do
      traceroutes_hop = traceroutes_hop_fixture()
      assert {:ok, %TraceroutesHop{}} = TraceroutesHops.delete_traceroutes_hop(traceroutes_hop)
      assert_raise Ecto.NoResultsError, fn -> TraceroutesHops.get_traceroutes_hop!(traceroutes_hop.id) end
    end

    test "change_traceroutes_hop/1 returns a traceroutes_hop changeset" do
      traceroutes_hop = traceroutes_hop_fixture()
      assert %Ecto.Changeset{} = TraceroutesHops.change_traceroutes_hop(traceroutes_hop)
    end
  end
end
