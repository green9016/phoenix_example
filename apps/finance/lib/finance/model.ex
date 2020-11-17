defmodule BCT.Model do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
      import Ecto.Query

      alias BCT.{
        Account,
        Customer,
        Deposit,
        Ledger,
        Repo,
        Transfer,
        Entry
      }
    end
  end
end
