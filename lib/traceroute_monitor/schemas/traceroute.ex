defmodule TracerouteMonitor.Traceroute do
  use Ecto.Schema
  import Ecto.Changeset

  schema "traceroutes" do
    belongs_to :host, TracerouteMonitor.Host
    has_many :traceroutes_hops, TracerouteMonitor.TracerouteHop

    timestamps()
  end

  def changeset(traceroute, attrs) do
    traceroute
    |> cast(attrs, [:host_id])
    |> validate_required([:host_id])
  end
end
