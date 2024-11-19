# defmodule StudySync.Users.User do
#   use Ecto.Schema
#   use Pow.Ecto.Schema

#   schema "users" do
#     pow_user_fields()
  
#     has_many :groups, StudySync.Groups.Group, foreign_key: :creator_id



#     timestamps()
#   end
# end
#------------------------------------------------------------------------------
defmodule StudySync.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  
  schema "users" do
    field :email, :string
    field :password_hash, :string
    has_many :groups, StudySync.Groups.Group, foreign_key: :creator_id
    
    timestamps()
  end
end