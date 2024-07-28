defmodule TracerouteMonitor.Repo.Migrations.CreateTraceroutesHops do
  use Ecto.Migration

  def change do
    create table(:traceroutes_hops) do
      add :traceroute_id, references(:traceroutes, on_delete: :delete_all)
      add :order, :integer
      add :host, :string
      add :loss, :float
      add :snt, :integer
      add :avg, :float

      timestamps()
    end

    create index(:traceroutes_hops, [:traceroute_id])
  end
end
