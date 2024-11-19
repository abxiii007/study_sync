defmodule StudySync.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :description, :text
      add :public, :boolean, default: true, null: false
      add :creator_id, references(:users, on_delete: :delete_all), null: false


      timestamps(type: :utc_datetime)
    end
    create index(:groups, [:creator_id])

  end
end
