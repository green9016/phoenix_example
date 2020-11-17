defmodule BctWeb.Application do
  @modulefoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(BctWeb.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: BctWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    BctWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
