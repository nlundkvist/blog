defmodule Blog.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :github_user, :string

      timestamps()
    end

    create unique_index(:authors, [:name])
    create unique_index(:authors, [:github_user])
  end
end
