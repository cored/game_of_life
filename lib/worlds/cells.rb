require_relative 'cells/cell'
require_relative 'cells/neighbors'

module GameOfLife
  module Worlds
    module Cells
      Replace =->(population) do
        neighbors = Neighbors.for(population)
      end
    end
  end
end
