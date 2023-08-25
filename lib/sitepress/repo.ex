defmodule Sitepress.Repo do
  use Ecto.Repo,
    otp_app: :sitepress,
    adapter: Ecto.Adapters.Postgres
end
