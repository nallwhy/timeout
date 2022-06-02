defmodule TimeoutWeb.Api.TimeoutController do
  use TimeoutWeb, :controller

  def any(conn, %{"timeout" => timeout}) do
    timeout = timeout |> ensure_integer()

    Process.sleep(:timer.seconds(timeout))

    conn
    |> json(%{timeout: timeout})
  end

  defp ensure_integer(string) when is_binary(string) do
    {integer, _} = string |> Integer.parse()

    integer
  end

  defp ensure_integer(number) when is_number(number) do
    number |> trunc()
  end
end
