defmodule StudySync.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :name, :string
    field :description, :string
    field :public, :boolean, default: true
    belongs_to :creator, StudySync.Users.User
  
    timestamps()
  end
  

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :description, :public])
    |> validate_required([:name, :description, :public])
  end
end
