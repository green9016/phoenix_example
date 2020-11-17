defmodule BctWeb.SessionController do
  use BctWeb.Web, :controller

  def new(conn, _params) do
    customers = BCT.customers()
    render conn, "new.html", customers: customers
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Auth.sign_in(email, password) do
      {:ok, account} ->
        customer = BCT.find_customer!(auth_account_id: account.id)

        conn
        |> put_session(:customer_id, customer.id)
        |> redirect(to: "/")
      {:error, _} ->
        customers = BCT.customers()
        render(conn, "new.html", customers: customers)
    end
  end

  def sign_in_as(conn, %{"username" => username}) do
		customer = BCT.find_customer!(username: username)

    conn
    |> put_session(:customer_id, customer.id)
    |> redirect(to: "/")
  end

  def sign_out(conn, _params) do
    conn
    |> clear_session()
    |> redirect(to: "/")
  end
end
