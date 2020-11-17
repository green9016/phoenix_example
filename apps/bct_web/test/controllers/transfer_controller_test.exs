defmodule BctWeb.TransferControllerTest do
  use BctWeb.ConnCase

  @moduletag isolation: :serializable

  setup do
    :ok = Messenger.Local.setup()

    alice = BCT.create_customer!("alice", "alice@example.com")
    bob = BCT.create_customer!("bob", "bob@example.com")
    BCT.create_deposit!(alice, ~M"10 USD")

    conn = assign(build_conn(), :current_customer, alice)

    {:ok, %{conn: conn, alice: alice, bob: bob}}
  end

  test "create: success", %{conn: conn} do
    params = %{
      amount_string: "2.01",
      destination_username: "bob",
      description: "Lunch money"
    }
    conn = post conn, "/transfers", %{"transfer" => params}
    assert html_response(conn, 302)
  end

  test "create: invalid amount", %{conn: conn} do
    conn = post conn, "/transfers", %{"transfer" => %{amount_string: "bad"}}
    assert html_response(conn, 200) =~ "is invalid"
  end
end
