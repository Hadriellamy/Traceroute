defmodule TracerouteMonitorWeb.TraceroutesHopController do
  use TracerouteMonitorWeb, :controller

  alias TracerouteMonitor.TraceroutesHops
  alias TracerouteMonitor.TraceroutesHops.TraceroutesHop

  def index(conn, _params) do
    traceroutes_hops = TraceroutesHops.list_traceroutes_hops()
    render(conn, :index, traceroutes_hops: traceroutes_hops)
  end

  def new(conn, _params) do
    changeset = TraceroutesHops.change_traceroutes_hop(%TraceroutesHop{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"traceroutes_hop" => traceroutes_hop_params}) do
    case TraceroutesHops.create_traceroutes_hop(traceroutes_hop_params) do
      {:ok, traceroutes_hop} ->
        conn
        |> put_flash(:info, "Traceroutes hop created successfully.")
        |> redirect(to: ~p"/traceroutes_hops/#{traceroutes_hop}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    traceroutes_hop = TraceroutesHops.get_traceroutes_hop!(id)
    render(conn, :show, traceroutes_hop: traceroutes_hop)
  end

  def edit(conn, %{"id" => id}) do
    traceroutes_hop = TraceroutesHops.get_traceroutes_hop!(id)
    changeset = TraceroutesHops.change_traceroutes_hop(traceroutes_hop)
    render(conn, :edit, traceroutes_hop: traceroutes_hop, changeset: changeset)
  end

  def update(conn, %{"id" => id, "traceroutes_hop" => traceroutes_hop_params}) do
    traceroutes_hop = TraceroutesHops.get_traceroutes_hop!(id)

    case TraceroutesHops.update_traceroutes_hop(traceroutes_hop, traceroutes_hop_params) do
      {:ok, traceroutes_hop} ->
        conn
        |> put_flash(:info, "Traceroutes hop updated successfully.")
        |> redirect(to: ~p"/traceroutes_hops/#{traceroutes_hop}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, traceroutes_hop: traceroutes_hop, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    traceroutes_hop = TraceroutesHops.get_traceroutes_hop!(id)
    {:ok, _traceroutes_hop} = TraceroutesHops.delete_traceroutes_hop(traceroutes_hop)

    conn
    |> put_flash(:info, "Traceroutes hop deleted successfully.")
    |> redirect(to: ~p"/traceroutes_hops")
  end
end
