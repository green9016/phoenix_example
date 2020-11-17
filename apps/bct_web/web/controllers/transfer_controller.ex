defmodule BctWeb.TransferController do
  use BctWeb.Web, :controller
  plug :require_authenticated

  def new(conn, _params) do
    customer = conn.assigns.current_customer
    transfer = BCT.build_transfer(customer)
    render conn, "new.html", transfer: transfer
  end

  def create(conn, %{"transfer" => transfer_params}) do
    customer = conn.assigns.current_customer

    case BCT.create_transfer(customer, transfer_params) do
      {:ok, _transfer} ->
        redirect conn, to: account_path(conn, :show)
      {:error, changeset} ->
        changeset = %{changeset | action: :transfer}
        render conn, "new.html", transfer: changeset
    end
  end
end
