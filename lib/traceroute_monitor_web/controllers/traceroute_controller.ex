defmodule TracerouteMonitorWeb.TracerouteController do
  use TracerouteMonitorWeb, :controller

  alias TracerouteMonitor.Traceroutes
  alias TracerouteMonitor.Traceroutes.Traceroute

  def index(conn, _params) do
    traceroutes = Traceroutes.list_traceroutes()
    render(conn, :index, traceroutes: traceroutes)
  end

  def new(conn, _params) do
    changeset = Traceroutes.change_traceroute(%Traceroute{})
    render(conn, :new, changeset: changeset)
  end
 
  def create(conn, %{"traceroute" => traceroute_params}) do
    case Traceroutes.create_traceroute(traceroute_params) do
      {:ok, traceroute} ->
        conn
        |> put_flash(:info, "Traceroute created successfully.")
        |> redirect(to: ~p"/traceroutes/#{traceroute}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    traceroute = Traceroutes.get_traceroute!(id)
    render(conn, :show, traceroute: traceroute)
  end

  def edit(conn, %{"id" => id}) do
    traceroute = Traceroutes.get_traceroute!(id)
    changeset = Traceroutes.change_traceroute(traceroute)
    render(conn, :edit, traceroute: traceroute, changeset: changeset)
  end

  def update(conn, %{"id" => id, "traceroute" => traceroute_params}) do
    traceroute = Traceroutes.get_traceroute!(id)

    case Traceroutes.update_traceroute(traceroute, traceroute_params) do
      {:ok, traceroute} ->
        conn
        |> put_flash(:info, "Traceroute updated successfully.")
        |> redirect(to: ~p"/traceroutes/#{traceroute}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, traceroute: traceroute, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    traceroute = Traceroutes.get_traceroute!(id)
    {:ok, _traceroute} = Traceroutes.delete_traceroute(traceroute)

    conn
    |> put_flash(:info, "Traceroute deleted successfully.")
    |> redirect(to: ~p"/traceroutes")
  end
end
