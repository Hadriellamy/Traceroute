defmodule TracerouteMonitor.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TracerouteMonitor.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> TracerouteMonitor.Categories.create_category()

    category
  end
end
