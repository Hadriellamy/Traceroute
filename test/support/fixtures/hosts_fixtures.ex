defmodule TracerouteMonitor.HostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TracerouteMonitor.Hosts` context.
  """

  @doc """
  Generate a host.
  """
  def host_fixture(attrs \\ %{}) do
    {:ok, host} =
      attrs
      |> Enum.into(%{
        address: "some address",
        ip: "some ip",
        name: "some name"
      })
      |> TracerouteMonitor.Hosts.create_host()

    host
  end
end
