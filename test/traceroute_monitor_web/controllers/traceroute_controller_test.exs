defmodule TracerouteMonitorWeb.TracerouteControllerTest do
  use TracerouteMonitorWeb.ConnCase

  import TracerouteMonitor.TraceroutesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all traceroutes", %{conn: conn} do
      conn = get(conn, ~p"/traceroutes")
      assert html_response(conn, 200) =~ "Listing Traceroutes"
    end
  end

  describe "new traceroute" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/traceroutes/new")
      assert html_response(conn, 200) =~ "New Traceroute"
    end
  end

  describe "create traceroute" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/traceroutes", traceroute: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/traceroutes/#{id}"

      conn = get(conn, ~p"/traceroutes/#{id}")
      assert html_response(conn, 200) =~ "Traceroute #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/traceroutes", traceroute: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Traceroute"
    end
  end

  describe "edit traceroute" do
    setup [:create_traceroute]

    test "renders form for editing chosen traceroute", %{conn: conn, traceroute: traceroute} do
      conn = get(conn, ~p"/traceroutes/#{traceroute}/edit")
      assert html_response(conn, 200) =~ "Edit Traceroute"
    end
  end

  describe "update traceroute" do
    setup [:create_traceroute]

    test "redirects when data is valid", %{conn: conn, traceroute: traceroute} do
      conn = put(conn, ~p"/traceroutes/#{traceroute}", traceroute: @update_attrs)
      assert redirected_to(conn) == ~p"/traceroutes/#{traceroute}"

      conn = get(conn, ~p"/traceroutes/#{traceroute}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, traceroute: traceroute} do
      conn = put(conn, ~p"/traceroutes/#{traceroute}", traceroute: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Traceroute"
    end
  end

  describe "delete traceroute" do
    setup [:create_traceroute]

    test "deletes chosen traceroute", %{conn: conn, traceroute: traceroute} do
      conn = delete(conn, ~p"/traceroutes/#{traceroute}")
      assert redirected_to(conn) == ~p"/traceroutes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/traceroutes/#{traceroute}")
      end
    end
  end

  defp create_traceroute(_) do
    traceroute = traceroute_fixture()
    %{traceroute: traceroute}
  end
end
