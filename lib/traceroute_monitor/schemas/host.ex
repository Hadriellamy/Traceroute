defmodule TracerouteMonitor.Host do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hosts" do
    field :name, :string
    field :ip, :string
    field :address, :string
    belongs_to :category, TracerouteMonitor.Category
    has_many :traceroutes, TracerouteMonitor.Traceroute

    timestamps()
  end

  def changeset(host, attrs) do
    host
    |> cast(attrs, [:name, :ip, :address, :category_id])
    |> validate_required([:name, :ip, :address, :category_id])
  end
end
