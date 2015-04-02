defmodule PhoenixTokenAuth.Util do
  import Plug.Conn
  import Phoenix.Controller
  import Ecto.Query, only: [from: 2]

  def repo do
    Application.get_env(:phoenix_token_auth, :repo)
  end

  def crypto_provider do
    Application.get_env(:phoenix_token_auth, :crypto_provider, Comeonin.Bcrypt)
  end


  def send_error(conn, error, status \\ 422) do
    conn
    |> put_status(status)
    |> json %{errors: error}
  end

  def token_secret do
    Application.get_env(:phoenix_token_auth, :token_secret)
  end

  def presence_validator(field, nil), do: [{field, "can't be blank"}]
  def presence_validator(field, ""), do: [{field, "can't be blank"}]
  def presence_validator(field, _), do: []
end
