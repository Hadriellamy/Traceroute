defmodule TracerouteMonitorWeb.TracerouteHTML do
  use TracerouteMonitorWeb, :html

  embed_templates "traceroute_html/*"

  @doc """
  Renders a traceroute form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def traceroute_form(assigns)
end
