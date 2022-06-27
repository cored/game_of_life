require_relative 'worlds/location'
require_relative 'worlds/population'
require_relative 'worlds/cells'
require_relative 'worlds/world'

module GameOfLife
  module Worlds
    Replace =->(old_world, replace_cells = Cells::Replace) do
      current_population = old_world.population
      replaced_neighbors = replace_cells.(current_population)
      new_population = current_population.of(replaced_neighbors)

      old_world.of(new_population)
    end
  end
end
