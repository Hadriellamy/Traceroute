defmodule TracerouteMonitor.TraceroutesTest do
  use TracerouteMonitor.DataCase

  alias TracerouteMonitor.Traceroutes

  describe "traceroutes" do
    alias TracerouteMonitor.Traceroutes.Traceroute

    import TracerouteMonitor.TraceroutesFixtures

    @invalid_attrs %{}

    test "list_traceroutes/0 returns all traceroutes" do
      traceroute = traceroute_fixture()
      assert Traceroutes.list_traceroutes() == [traceroute]
    end

    test "get_traceroute!/1 returns the traceroute with given id" do
      traceroute = traceroute_fixture()
      assert Traceroutes.get_traceroute!(traceroute.id) == traceroute
    end

    test "create_traceroute/1 with valid data creates a traceroute" do
      valid_attrs = %{}

      assert {:ok, %Traceroute{} = traceroute} = Traceroutes.create_traceroute(valid_attrs)
    end

    test "create_traceroute/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Traceroutes.create_traceroute(@invalid_attrs)
    end

    test "update_traceroute/2 with valid data updates the traceroute" do
      traceroute = traceroute_fixture()
      update_attrs = %{}

      assert {:ok, %Traceroute{} = traceroute} = Traceroutes.update_traceroute(traceroute, update_attrs)
    end

    test "update_traceroute/2 with invalid data returns error changeset" do
      traceroute = traceroute_fixture()
      assert {:error, %Ecto.Changeset{}} = Traceroutes.update_traceroute(traceroute, @invalid_attrs)
      assert traceroute == Traceroutes.get_traceroute!(traceroute.id)
    end

    test "delete_traceroute/1 deletes the traceroute" do
      traceroute = traceroute_fixture()
      assert {:ok, %Traceroute{}} = Traceroutes.delete_traceroute(traceroute)
      assert_raise Ecto.NoResultsError, fn -> Traceroutes.get_traceroute!(traceroute.id) end
    end

    test "change_traceroute/1 returns a traceroute changeset" do
      traceroute = traceroute_fixture()
      assert %Ecto.Changeset{} = Traceroutes.change_traceroute(traceroute)
    end
  end
end
