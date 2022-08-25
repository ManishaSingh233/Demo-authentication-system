defmodule DemoCMS.Repo do
  use Ecto.Repo,
    otp_app: :demoCMS,
    adapter: Ecto.Adapters.Postgres
end
