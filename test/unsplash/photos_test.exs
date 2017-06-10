defmodule Unsplash.PhotosTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import PathHelpers

  test "Unsplash.Photos.all" do
    use_cassette "photos" do
      response = Unsplash.Photos.all |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.curated" do
    use_cassette "photos_curated" do
      response = Unsplash.Photos.curated |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.random(opts)" do
    use_cassette "photos_random" do
      response = Unsplash.Photos.random(query: "nature", w: 200, h: 200, ) |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.statistics(id)" do
    use_cassette "photos_statistics" do
      response = Unsplash.Photos.statistics("0XR2s9D3PLI") |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.download_link(id)" do
    use_cassette "photos_download_link" do
      response = Unsplash.Photos.download_link("0XR2s9D3PLI") |> Enum.at(0)
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.get(id, opts)" do
    use_cassette "photos_id" do
      response = Unsplash.Photos.get("0XR2s9D3PLI", rect: "4,4,200,200") |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.Update(id, opts)" do
    use_cassette "update_photo" do
      response = Unsplash.Photos.update("0XR2s9D3PLI", [location: [name: "Bishop"]]) |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.like(id)" do
    use_cassette "like_photo" do
      response = Unsplash.Photos.like("0XR2s9D3PLI") |> Enum.to_list
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

  test "Unsplash.Photos.unlike(id)" do
    use_cassette "unlike_photo" do
      response = Unsplash.Photos.unlike("0XR2s9D3PLI")
      assert response
      refute response |> Enum.into(%{}) |> Map.get("errors")
    end
  end

end
