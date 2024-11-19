defmodule StudySync.Repo do
  use Ecto.Repo,
    otp_app: :study_sync,
    adapter: Ecto.Adapters.Postgres
end
