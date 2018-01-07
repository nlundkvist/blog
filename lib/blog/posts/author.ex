defmodule Blog.Posts.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Posts.{Author, Post}


  schema "authors" do
    field :github_user, :string
    field :name, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author, attrs) do
    author
    |> cast(attrs, [:name, :github_user])
    |> validate_required([:name, :github_user])
    |> unique_constraint(:name)
    |> unique_constraint(:github_user)
  end
end
