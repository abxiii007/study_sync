defmodule StudySyncWeb.Router do
  use StudySyncWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {StudySyncWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug Pow.Plug.Base
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: StudySyncWeb.ErrorHandler
  end
  

  scope "/" do
    pipe_through :browser

    pow_routes()
  end
  scope "/", StudySyncWeb do
    pipe_through [:browser, :protected] # Add your authentication pipeline here

    resources "/groups", GroupController
  end
 
  

  scope "/", StudySyncWeb do
    pipe_through :browser

    get "/", PageController, :home
    # get "/login", SessionController, :new
    # post "/login", SessionController, :create
    # delete "/logout", SessionController, :delete

  end

  # Other scopes may use custom stacks.
  # scope "/api", StudySyncWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:study_sync, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: StudySyncWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
