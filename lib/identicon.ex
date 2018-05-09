defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(image) do
    %Identicon.Image{hex: hex} = image
    hex
    |> Enum.chunk(3)
    |> mirror_row
  end

  def mirror_row() do

  end

  def pick_color(image) do
    %Identicon.Image{hex: [r, g, b | _tail] } = image

    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
