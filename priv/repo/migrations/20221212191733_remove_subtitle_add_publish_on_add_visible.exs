defmodule Blog.Repo.Migrations.RemoveSubtitleAddPublishOnAddVisible do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :subtitle
      add :publish_on, :date
      add :visible, :boolean, default: true
    end
  end
end
