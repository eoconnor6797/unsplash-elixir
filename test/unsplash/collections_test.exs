defmodule Unsplash.CollectionsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "Unsplash.Collections.all" do
    use_cassette "collections" do
      response = Unsplash.Collections.all |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.featured" do
    use_cassette "featured_collections" do
      response = Unsplash.Collections.featured |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.curated_collections" do
    use_cassette "curated_collections" do
      response = Unsplash.Collections.curated |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.get(id)" do
    use_cassette "collections_id" do
      response = Unsplash.Collections.get("175361") |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.get_curated(id)" do
    use_cassette "collections_get_curated_id" do
      response = Unsplash.Collections.get_curated("103") |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.get_related(id)" do
    use_cassette "collections_get_related_id" do
      response = Unsplash.Collections.get_related("103") |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.photos(id)" do
    use_cassette "collections_photos_id" do
      response = Unsplash.Collections.photos("175361") |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.curated_photos(id)" do
    use_cassette "collections_curated_photos_id" do
      response = Unsplash.Collections.curated_photos("103") |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.related_photos(id)" do
    use_cassette "collections_related_photos_id" do
      response = Unsplash.Collections.related_photos("103") |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Collections.create(opts)" do
  end
  test "Unsplash.Collections.update(id, opts)" do
  end
  test "Unsplash.Collections.delete(id)" do
  end
  test "Unsplash.Collections.add_photo(id, photo_id)" do
  end
  test "Unsplash.Collections.remove_photo(id, photo_id)" do
  end

end
