defmodule BCT.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias BCT.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import BCT.Case

      import Money, only: [sigil_M: 2]
      use BCT.Model
    end
  end

  setup tags do
    opts = tags |> Map.take([:isolation]) |> Enum.to_list()
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BCT.Repo, opts)
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Auth.Repo, opts)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Auth.Repo, {:shared, self()})
      Ecto.Adapters.SQL.Sandbox.mode(BCT.Repo, {:shared, self()})
    end

    :ok
  end
end
