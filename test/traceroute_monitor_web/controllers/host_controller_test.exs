defmodule TracerouteMonitorWeb.HostControllerTest do
  use TracerouteMonitorWeb.ConnCase

  import TracerouteMonitor.HostsFixtures

  @create_attrs %{name: "some name", address: "some address", ip: "some ip"}
  @update_attrs %{name: "some updated name", address: "some updated address", ip: "some updated ip"}
  @invalid_attrs %{name: nil, address: nil, ip: nil}

  describe "index" do
    test "lists all hosts", %{conn: conn} do
      conn = get(conn, ~p"/hosts")
      assert html_response(conn, 200) =~ "Listing Hosts"
    end
  end

  describe "new host" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/hosts/new")
      assert html_response(conn, 200) =~ "New Host"
    end
  end

  describe "create host" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/hosts", host: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/hosts/#{id}"

      conn = get(conn, ~p"/hosts/#{id}")
      assert html_response(conn, 200) =~ "Host #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/hosts", host: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Host"
    end
  end

  describe "edit host" do
    setup [:create_host]

    test "renders form for editing chosen host", %{conn: conn, host: host} do
      conn = get(conn, ~p"/hosts/#{host}/edit")
      assert html_response(conn, 200) =~ "Edit Host"
    end
  end

  describe "update host" do
    setup [:create_host]

    test "redirects when data is valid", %{conn: conn, host: host} do
      conn = put(conn, ~p"/hosts/#{host}", host: @update_attrs)
      assert redirected_to(conn) == ~p"/hosts/#{host}"

      conn = get(conn, ~p"/hosts/#{host}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, host: host} do
      conn = put(conn, ~p"/hosts/#{host}", host: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Host"
    end
  end

  describe "delete host" do
    setup [:create_host]

    test "deletes chosen host", %{conn: conn, host: host} do
      conn = delete(conn, ~p"/hosts/#{host}")
      assert redirected_to(conn) == ~p"/hosts"

      assert_error_sent 404, fn ->
        get(conn, ~p"/hosts/#{host}")
      end
    end
  end

  defp create_host(_) do
    host = host_fixture()
    %{host: host}
  end
end
