defmodule TracerouteMonitorWeb.TraceroutesHopHTML do
  use TracerouteMonitorWeb, :html

  embed_templates "traceroutes_hop_html/*"

  @doc """
  Renders a traceroutes_hop form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def traceroutes_hop_form(assigns)
end
