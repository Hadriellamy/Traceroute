defmodule TracerouteMonitor.TraceroutesHopsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TracerouteMonitor.TraceroutesHops` context.
  """

  @doc """
  Generate a traceroutes_hop.
  """
  def traceroutes_hop_fixture(attrs \\ %{}) do
    {:ok, traceroutes_hop} =
      attrs
      |> Enum.into(%{
        avg: 120.5,
        host: "some host",
        loss: 120.5,
        order: 42,
        snt: 42
      })
      |> TracerouteMonitor.TraceroutesHops.create_traceroutes_hop()

    traceroutes_hop
  end
end
