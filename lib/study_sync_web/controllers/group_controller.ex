defmodule StudySyncWeb.GroupController do
  use StudySyncWeb, :controller

  alias StudySync.Groups
  alias StudySync.Groups.Group

  def index(conn, _params) do
    groups = Groups.list_groups()
    render(conn, :index, groups: groups)
  end

  def new(conn, _params) do
    changeset = Groups.change_group(%Group{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"group" => group_params}) do
    case Groups.create_group(group_params) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "Group created successfully.")
        |> redirect(to: ~p"/groups/#{group}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
############################################################################
# def create(conn, %{"group" => group_params}) do
#   # Get the current logged-in user
#   current_user = Pow.Plug.current_user(conn)
  
#   # Add the `creator_id` to the group parameters
#   group_params = Map.put(group_params, "creator_id", current_user.id)

#   case StudySync.Groups.create_group(group_params) do
#     {:ok, group} ->
#       conn
#       |> put_flash(:info, "Group created successfully.")
#       |> redirect(to: Routes.group_path(conn, :show, group))
#     {:error, changeset} ->
#       render(conn, "new.html", changeset: changeset)
#   end
#  #   IO.inspect(current_user, label: "Current User")
#  # IO.inspect(group_params, label: "Group Params")
# end

  ###########################################################################

  def show(conn, %{"id" => id}) do
    group = Groups.get_group!(id)
    render(conn, :show, group: group)
  end

  def edit(conn, %{"id" => id}) do
    group = Groups.get_group!(id)
    changeset = Groups.change_group(group)
    render(conn, :edit, group: group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "group" => group_params}) do
    group = Groups.get_group!(id)

    case Groups.update_group(group, group_params) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "Group updated successfully.")
        |> redirect(to: ~p"/groups/#{group}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, group: group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    group = Groups.get_group!(id)
    {:ok, _group} = Groups.delete_group(group)

    conn
    |> put_flash(:info, "Group deleted successfully.")
    |> redirect(to: ~p"/groups")
  end
end
