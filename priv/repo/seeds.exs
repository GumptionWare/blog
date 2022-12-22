# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Blog.Posts
alias Blog.Comments.Comment
alias Blog.Repo


# Create a post without any comments.
Posts.create_post(%{title: "Long and Lonely Post", content: Faker.Lorem.sentence(100)})
# Create 100 posts, each with 100 long comments:
Enum.each(1..100, fn _ ->
  # Create a post with a comment.
  {:ok, post} = Posts.create_post(%{title: "Long and Happy Post", content: Faker.Lorem.sentence(100)})
  Enum.each(1..100, fn _ ->
    %Comment{}
    |> Comment.changeset(%{content: Faker.Lorem.sentence(100)})
    |> Ecto.Changeset.put_assoc(:post, post)
    |> Repo.insert!()
  end)
end)
