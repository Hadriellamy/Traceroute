defmodule TracerouteMonitor.Hosts.Host do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hosts" do
    field :name, :string
    field :address, :string
    field :ip, :string
    field :category_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(host, attrs) do
    host
    |> cast(attrs, [:name, :ip, :address])
    |> validate_required([:name, :ip, :address])
  end
end
