defmodule TracerouteMonitor.Traceroutes do
  @moduledoc """
  The Traceroutes context.
  """

  import Ecto.Query, warn: false
  alias TracerouteMonitor.Repo

  alias TracerouteMonitor.Traceroutes.Traceroute

  @doc """
  Returns the list of traceroutes.

  ## Examples

      iex> list_traceroutes()
      [%Traceroute{}, ...]

  """
  def list_traceroutes do
    Repo.all(Traceroute)
  end

  @doc """
  Gets a single traceroute.

  Raises `Ecto.NoResultsError` if the Traceroute does not exist.

  ## Examples

      iex> get_traceroute!(123)
      %Traceroute{}

      iex> get_traceroute!(456)
      ** (Ecto.NoResultsError)

  """
  def get_traceroute!(id), do: Repo.get!(Traceroute, id)

  @doc """
  Creates a traceroute.

  ## Examples

      iex> create_traceroute(%{field: value})
      {:ok, %Traceroute{}}

      iex> create_traceroute(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_traceroute(attrs \\ %{}) do
    %Traceroute{}
    |> Traceroute.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a traceroute.

  ## Examples

      iex> update_traceroute(traceroute, %{field: new_value})
      {:ok, %Traceroute{}}

      iex> update_traceroute(traceroute, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_traceroute(%Traceroute{} = traceroute, attrs) do
    traceroute
    |> Traceroute.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a traceroute.

  ## Examples

      iex> delete_traceroute(traceroute)
      {:ok, %Traceroute{}}

      iex> delete_traceroute(traceroute)
      {:error, %Ecto.Changeset{}}

  """
  def delete_traceroute(%Traceroute{} = traceroute) do
    Repo.delete(traceroute)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking traceroute changes.

  ## Examples

      iex> change_traceroute(traceroute)
      %Ecto.Changeset{data: %Traceroute{}}

  """
  def change_traceroute(%Traceroute{} = traceroute, attrs \\ %{}) do
    Traceroute.changeset(traceroute, attrs)
  end
end
