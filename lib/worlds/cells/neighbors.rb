module GameOfLife
  module Worlds
    module Cells
      Neighbors= Struct.new(:neighbors, keyword_init: true) do
        def self.for(population)
          neighbors = population.each_with_object({}) do |(location, _), neighbors|
            neighbors[location] = [population.at(location.north),
                                   population.at(location.south),
                                   population.at(location.east),
                                   population.at(location.west)].compact
          end

          new( neighbors: neighbors )
        end

        def at(location)
          neighbors.fetch(location)
        end

        def to_h
          neighbors.each_with_object({}) do |(location, neighbors), display|
            display.merge!({ location.to_a => neighbors.map(&:to_h) })
          end
        end
      end
    end
  end
end
