defmodule Blog.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :title, :string
    field :publish_on, :date
    field :visible, :boolean
    has_many :comments, Blog.Comments.Comment
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
    |> validate_length(:title, min: 3, max: 50)
  end
end
