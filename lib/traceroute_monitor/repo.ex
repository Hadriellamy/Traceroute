defmodule TracerouteMonitor.Repo do
  use Ecto.Repo,
    otp_app: :traceroute_monitor,
    adapter: Ecto.Adapters.MyXQL
end
