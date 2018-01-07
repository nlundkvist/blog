defmodule Blog.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Posts.{Post, Author, Comment}


  schema "posts" do
    field :content, :string
    field :slug, :string
    field :title, :string
    field :views, :integer
    has_many :comments, Comment 
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :content, :slug, :author_id])
    |> validate_required([:title, :content, :slug, :author_id])
    |> unique_constraint(:slug)
  end
end
