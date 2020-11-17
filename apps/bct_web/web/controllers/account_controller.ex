defmodule BctWeb.AccountController do
  use BctWeb.Web, :controller
  plug :require_authenticated

  def show(conn, _params) do
    customer = conn.assigns.current_customer
    balance = BCT.balance(customer)
    transactions = BCT.transactions(customer)

    render conn, "show.html", balance: balance, transactions: transactions
  end
end
