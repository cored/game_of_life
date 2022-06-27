require_relative 'worlds'

module GameOfLife
  extend self

  def call(generations, replace_world = Worlds::Replace)
    world = Worlds::World.build

    worlds = 1.upto(generations).map do |_|
      replace_world.(world)
    end

  end

end
