defmodule TracerouteMonitor.TraceroutesHops do
  @moduledoc """
  The TraceroutesHops context.
  """

  import Ecto.Query, warn: false
  alias TracerouteMonitor.Repo

  alias TracerouteMonitor.TraceroutesHops.TraceroutesHop

  @doc """
  Returns the list of traceroutes_hops.

  ## Examples

      iex> list_traceroutes_hops()
      [%TraceroutesHop{}, ...]

  """
  def list_traceroutes_hops do
    Repo.all(TraceroutesHop)
  end

  @doc """
  Gets a single traceroutes_hop.

  Raises `Ecto.NoResultsError` if the Traceroutes hop does not exist.

  ## Examples

      iex> get_traceroutes_hop!(123)
      %TraceroutesHop{}

      iex> get_traceroutes_hop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_traceroutes_hop!(id), do: Repo.get!(TraceroutesHop, id)

  @doc """
  Creates a traceroutes_hop.

  ## Examples

      iex> create_traceroutes_hop(%{field: value})
      {:ok, %TraceroutesHop{}}

      iex> create_traceroutes_hop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_traceroutes_hop(attrs \\ %{}) do
    %TraceroutesHop{}
    |> TraceroutesHop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a traceroutes_hop.

  ## Examples

      iex> update_traceroutes_hop(traceroutes_hop, %{field: new_value})
      {:ok, %TraceroutesHop{}}

      iex> update_traceroutes_hop(traceroutes_hop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_traceroutes_hop(%TraceroutesHop{} = traceroutes_hop, attrs) do
    traceroutes_hop
    |> TraceroutesHop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a traceroutes_hop.

  ## Examples

      iex> delete_traceroutes_hop(traceroutes_hop)
      {:ok, %TraceroutesHop{}}

      iex> delete_traceroutes_hop(traceroutes_hop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_traceroutes_hop(%TraceroutesHop{} = traceroutes_hop) do
    Repo.delete(traceroutes_hop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking traceroutes_hop changes.

  ## Examples

      iex> change_traceroutes_hop(traceroutes_hop)
      %Ecto.Changeset{data: %TraceroutesHop{}}

  """
  def change_traceroutes_hop(%TraceroutesHop{} = traceroutes_hop, attrs \\ %{}) do
    TraceroutesHop.changeset(traceroutes_hop, attrs)
  end
end
