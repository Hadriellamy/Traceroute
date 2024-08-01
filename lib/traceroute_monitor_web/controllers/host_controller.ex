defmodule TracerouteMonitorWeb.HostController do
  use TracerouteMonitorWeb, :controller

  alias TracerouteMonitor.Hosts
  alias TracerouteMonitor.Hosts.Host

  def index(conn, _params) do
    hosts = Hosts.list_hosts()
    render(conn, :index, hosts: hosts)
  end

  def new(conn, _params) do
    changeset = Hosts.change_host(%Host{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"host" => host_params}) do
    case Hosts.create_host(host_params) do
      {:ok, host} ->
        conn
        |> put_flash(:info, "Host created successfully.")
        |> redirect(to: ~p"/hosts/#{host}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    host = Hosts.get_host!(id)
    render(conn, :show, host: host)
  end

  def edit(conn, %{"id" => id}) do
    host = Hosts.get_host!(id)
    changeset = Hosts.change_host(host)
    render(conn, :edit, host: host, changeset: changeset)
  end

  def update(conn, %{"id" => id, "host" => host_params}) do
    host = Hosts.get_host!(id)

    case Hosts.update_host(host, host_params) do
      {:ok, host} ->
        conn
        |> put_flash(:info, "Host updated successfully.")
        |> redirect(to: ~p"/hosts/#{host}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, host: host, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    host = Hosts.get_host!(id)
    {:ok, _host} = Hosts.delete_host(host)

    conn
    |> put_flash(:info, "Host deleted successfully.")
    |> redirect(to: ~p"/hosts")
  end
end
