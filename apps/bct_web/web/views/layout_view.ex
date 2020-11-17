defmodule BctWeb.LayoutView do
  use BctWeb.Web, :view

  def nav_link(conn, title, opts) do
    active? = conn.request_path == Keyword.fetch!(opts, :to)
    class = if active?, do: "active", else: ""

    content_tag(:li, link(title, opts), class: class)
  end
end
