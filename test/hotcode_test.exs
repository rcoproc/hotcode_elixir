defmodule HotcodeTest do
  use ExUnit.Case
  doctest Hotcode

  test "greets the world" do
    assert Hotcode.hello() == :world
  end
end
