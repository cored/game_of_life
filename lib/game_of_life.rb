module GameOfLife
  extend self

  module Worlds
    Replace =->(world) do
      world
    end
  end

  def call(generations,
           time_limit,
           generate_world, replace_world = Worlds::Replace, display_world)
    world = generate_world.call

    1.upto(generations) do |_|
      display_world.(world)
      world = replace_world.(world)
    end

    display_world.(world)
  end

end
