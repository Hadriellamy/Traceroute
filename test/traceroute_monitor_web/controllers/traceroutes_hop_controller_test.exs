defmodule TracerouteMonitorWeb.TraceroutesHopControllerTest do
  use TracerouteMonitorWeb.ConnCase

  import TracerouteMonitor.TraceroutesHopsFixtures

  @create_attrs %{host: "some host", order: 42, loss: 120.5, snt: 42, avg: 120.5}
  @update_attrs %{host: "some updated host", order: 43, loss: 456.7, snt: 43, avg: 456.7}
  @invalid_attrs %{host: nil, order: nil, loss: nil, snt: nil, avg: nil}

  describe "index" do
    test "lists all traceroutes_hops", %{conn: conn} do
      conn = get(conn, ~p"/traceroutes_hops")
      assert html_response(conn, 200) =~ "Listing Traceroutes hops"
    end
  end

  describe "new traceroutes_hop" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/traceroutes_hops/new")
      assert html_response(conn, 200) =~ "New Traceroutes hop"
    end
  end

  describe "create traceroutes_hop" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/traceroutes_hops", traceroutes_hop: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/traceroutes_hops/#{id}"

      conn = get(conn, ~p"/traceroutes_hops/#{id}")
      assert html_response(conn, 200) =~ "Traceroutes hop #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/traceroutes_hops", traceroutes_hop: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Traceroutes hop"
    end
  end

  describe "edit traceroutes_hop" do
    setup [:create_traceroutes_hop]

    test "renders form for editing chosen traceroutes_hop", %{conn: conn, traceroutes_hop: traceroutes_hop} do
      conn = get(conn, ~p"/traceroutes_hops/#{traceroutes_hop}/edit")
      assert html_response(conn, 200) =~ "Edit Traceroutes hop"
    end
  end

  describe "update traceroutes_hop" do
    setup [:create_traceroutes_hop]

    test "redirects when data is valid", %{conn: conn, traceroutes_hop: traceroutes_hop} do
      conn = put(conn, ~p"/traceroutes_hops/#{traceroutes_hop}", traceroutes_hop: @update_attrs)
      assert redirected_to(conn) == ~p"/traceroutes_hops/#{traceroutes_hop}"

      conn = get(conn, ~p"/traceroutes_hops/#{traceroutes_hop}")
      assert html_response(conn, 200) =~ "some updated host"
    end

    test "renders errors when data is invalid", %{conn: conn, traceroutes_hop: traceroutes_hop} do
      conn = put(conn, ~p"/traceroutes_hops/#{traceroutes_hop}", traceroutes_hop: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Traceroutes hop"
    end
  end

  describe "delete traceroutes_hop" do
    setup [:create_traceroutes_hop]

    test "deletes chosen traceroutes_hop", %{conn: conn, traceroutes_hop: traceroutes_hop} do
      conn = delete(conn, ~p"/traceroutes_hops/#{traceroutes_hop}")
      assert redirected_to(conn) == ~p"/traceroutes_hops"

      assert_error_sent 404, fn ->
        get(conn, ~p"/traceroutes_hops/#{traceroutes_hop}")
      end
    end
  end

  defp create_traceroutes_hop(_) do
    traceroutes_hop = traceroutes_hop_fixture()
    %{traceroutes_hop: traceroutes_hop}
  end
end
