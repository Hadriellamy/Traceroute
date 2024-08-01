defmodule TracerouteMonitor.TraceroutesHops.TraceroutesHop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "traceroutes_hops" do
    field :host, :string
    field :order, :integer
    field :loss, :float
    field :snt, :integer
    field :avg, :float
    field :traceroute_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(traceroutes_hop, attrs) do
    traceroutes_hop
    |> cast(attrs, [:order, :host, :loss, :snt, :avg])
    |> validate_required([:order, :host, :loss, :snt, :avg])
  end
end
