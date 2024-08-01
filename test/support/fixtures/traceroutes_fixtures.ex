defmodule TracerouteMonitor.TraceroutesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TracerouteMonitor.Traceroutes` context.
  """

  @doc """
  Generate a traceroute.
  """
  def traceroute_fixture(attrs \\ %{}) do
    {:ok, traceroute} =
      attrs
      |> Enum.into(%{

      })
      |> TracerouteMonitor.Traceroutes.create_traceroute()

    traceroute
  end
end
