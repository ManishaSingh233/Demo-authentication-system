defmodule DemoCMS.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DemoCMS.Repo,
      # Start the Telemetry supervisor
      DemoCMSWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DemoCMS.PubSub},
      # Start the Endpoint (http/https)
      DemoCMSWeb.Endpoint
      # Start a worker by calling: DemoCMS.Worker.start_link(arg)
      # {DemoCMS.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DemoCMS.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DemoCMSWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
