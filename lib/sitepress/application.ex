defmodule Sitepress.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SitepressWeb.Telemetry,
      # Start the Ecto repository
      Sitepress.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sitepress.PubSub},
      # Start Finch
      {Finch, name: Sitepress.Finch},
      # Start the Endpoint (http/https)
      SitepressWeb.Endpoint
      # Start a worker by calling: Sitepress.Worker.start_link(arg)
      # {Sitepress.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sitepress.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SitepressWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
