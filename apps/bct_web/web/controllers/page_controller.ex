defmodule BctWeb.PageController do
  use BctWeb.Web, :controller
  plug :require_authenticated

  def index(conn, _params) do
    render conn, "index.html"
  end
end
