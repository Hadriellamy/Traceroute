defmodule TracerouteMonitorWeb.HostHTML do
  use TracerouteMonitorWeb, :html

  embed_templates "host_html/*"

  @doc """
  Renders a host form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def host_form(assigns)
end
