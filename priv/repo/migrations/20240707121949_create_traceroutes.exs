defmodule TracerouteMonitor.Repo.Migrations.CreateTraceroutes do
  use Ecto.Migration

  def change do
    create table(:traceroutes) do
      add :host_id, references(:hosts, on_delete: :delete_all)

      timestamps()
    end

    create index(:traceroutes, [:host_id])
  end
end
