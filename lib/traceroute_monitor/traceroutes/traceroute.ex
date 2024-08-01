defmodule TracerouteMonitor.Traceroutes.Traceroute do
  use Ecto.Schema
  import Ecto.Changeset

  schema "traceroutes" do

    field :host_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(traceroute, attrs) do
    traceroute
    |> cast(attrs, [])
    |> validate_required([])
  end
end
