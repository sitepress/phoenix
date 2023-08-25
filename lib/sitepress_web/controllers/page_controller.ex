defmodule SitepressWeb.PageController do
  use SitepressWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def show(conn, _params) do
    # TODO: Find the HTML pages
  end
end
