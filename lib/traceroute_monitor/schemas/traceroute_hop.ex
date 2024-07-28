defmodule TracerouteMonitor.TracerouteHop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "traceroutes_hops" do
    field :order, :integer
    field :host, :string
    field :loss, :float
    field :snt, :integer
    field :avg, :float
    belongs_to :traceroute, TracerouteMonitor.Traceroute

    timestamps()
  end

  def changeset(traceroute_hop, attrs) do
    traceroute_hop
    |> cast(attrs, [:order, :host, :loss, :snt, :avg, :traceroute_id])
    |> validate_required([:order, :host, :loss, :snt, :avg, :traceroute_id])
  end
end
