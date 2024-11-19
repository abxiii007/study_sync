defmodule StudySyncWeb.ErrorHandler do
    import Plug.Conn
  
    def call(conn, {:error, _reason}) do
      conn
      |> Phoenix.Controller.put_flash(:error, "You need to sign in to access that page.")
      |> Phoenix.Controller.redirect(to: "/session/new")
      |> halt()
    end
  end
  
#   defmodule StudySyncWeb.ErrorHandler do
#     import Plug.Conn
  
#     def call(conn, :not_authenticated) do
#       conn
#       |> put_flash(:error, "You must be logged in to access this page.")
#       |> redirect(to: "/login") # Ensure you have a login route
#       |> halt()
#     end
#   end
  