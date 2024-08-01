defmodule TracerouteMonitor.HostsTest do
  use TracerouteMonitor.DataCase

  alias TracerouteMonitor.Hosts

  describe "hosts" do
    alias TracerouteMonitor.Hosts.Host

    import TracerouteMonitor.HostsFixtures

    @invalid_attrs %{name: nil, address: nil, ip: nil}

    test "list_hosts/0 returns all hosts" do
      host = host_fixture()
      assert Hosts.list_hosts() == [host]
    end

    test "get_host!/1 returns the host with given id" do
      host = host_fixture()
      assert Hosts.get_host!(host.id) == host
    end

    test "create_host/1 with valid data creates a host" do
      valid_attrs = %{name: "some name", address: "some address", ip: "some ip"}

      assert {:ok, %Host{} = host} = Hosts.create_host(valid_attrs)
      assert host.name == "some name"
      assert host.address == "some address"
      assert host.ip == "some ip"
    end

    test "create_host/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hosts.create_host(@invalid_attrs)
    end

    test "update_host/2 with valid data updates the host" do
      host = host_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", ip: "some updated ip"}

      assert {:ok, %Host{} = host} = Hosts.update_host(host, update_attrs)
      assert host.name == "some updated name"
      assert host.address == "some updated address"
      assert host.ip == "some updated ip"
    end

    test "update_host/2 with invalid data returns error changeset" do
      host = host_fixture()
      assert {:error, %Ecto.Changeset{}} = Hosts.update_host(host, @invalid_attrs)
      assert host == Hosts.get_host!(host.id)
    end

    test "delete_host/1 deletes the host" do
      host = host_fixture()
      assert {:ok, %Host{}} = Hosts.delete_host(host)
      assert_raise Ecto.NoResultsError, fn -> Hosts.get_host!(host.id) end
    end

    test "change_host/1 returns a host changeset" do
      host = host_fixture()
      assert %Ecto.Changeset{} = Hosts.change_host(host)
    end
  end
end
