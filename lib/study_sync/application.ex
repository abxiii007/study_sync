defmodule StudySync.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StudySyncWeb.Telemetry,
      StudySync.Repo,
      {DNSCluster, query: Application.get_env(:study_sync, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StudySync.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: StudySync.Finch},
      # Start a worker by calling: StudySync.Worker.start_link(arg)
      # {StudySync.Worker, arg},
      # Start to serve requests, typically the last entry
      StudySyncWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StudySync.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StudySyncWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
