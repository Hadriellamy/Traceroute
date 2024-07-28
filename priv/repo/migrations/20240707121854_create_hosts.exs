defmodule TracerouteMonitor.Repo.Migrations.CreateHosts do
  use Ecto.Migration

  def change do
    create table(:hosts) do
      add :category_id, references(:categories, on_delete: :delete_all)
      add :name, :string
      add :ip, :string
      add :address, :string

      timestamps()
    end

    create index(:hosts, [:category_id])
  end
end
