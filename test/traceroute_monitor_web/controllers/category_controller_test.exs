defmodule TracerouteMonitorWeb.CategoryControllerTest do
  use TracerouteMonitorWeb.ConnCase

  import TracerouteMonitor.CategoriesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all categories", %{conn: conn} do
      conn = get(conn, ~p"/categories")
      assert html_response(conn, 200) =~ "Listing Categories"
    end
  end

  describe "new category" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/categories/new")
      assert html_response(conn, 200) =~ "New Category"
    end
  end

  describe "create category" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/categories", category: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/categories/#{id}"

      conn = get(conn, ~p"/categories/#{id}")
      assert html_response(conn, 200) =~ "Category #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/categories", category: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Category"
    end
  end

  describe "edit category" do
    setup [:create_category]

    test "renders form for editing chosen category", %{conn: conn, category: category} do
      conn = get(conn, ~p"/categories/#{category}/edit")
      assert html_response(conn, 200) =~ "Edit Category"
    end
  end

  describe "update category" do
    setup [:create_category]

    test "redirects when data is valid", %{conn: conn, category: category} do
      conn = put(conn, ~p"/categories/#{category}", category: @update_attrs)
      assert redirected_to(conn) == ~p"/categories/#{category}"

      conn = get(conn, ~p"/categories/#{category}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, category: category} do
      conn = put(conn, ~p"/categories/#{category}", category: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Category"
    end
  end

  describe "delete category" do
    setup [:create_category]

    test "deletes chosen category", %{conn: conn, category: category} do
      conn = delete(conn, ~p"/categories/#{category}")
      assert redirected_to(conn) == ~p"/categories"

      assert_error_sent 404, fn ->
        get(conn, ~p"/categories/#{category}")
      end
    end
  end

  defp create_category(_) do
    category = category_fixture()
    %{category: category}
  end
end
