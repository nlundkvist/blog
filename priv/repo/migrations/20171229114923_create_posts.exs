defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :slug, :string
      add :author_id, references(:authors, on_delete: :delete_all), null: false
      add :views, :integer, default: 0

      timestamps()
    end

    create unique_index(:posts, [:slug])
    create index(:posts, [:author_id])
  end
end
