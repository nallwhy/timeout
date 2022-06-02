defmodule TimeoutWeb.PageController do
  use TimeoutWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
