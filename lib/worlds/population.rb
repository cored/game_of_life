module GameOfLife
  module Worlds
    RANDOM_SEED = 2
    Population = Struct.new(:population, keyword_init: true) do
      include Enumerable

      def each(&block)
        population.each(&block)
      end

      def at(location)
        population[location]
      end

      def of(neighbors)
        self.class.new(
          population: population.each_with_object({}) do |(location, cell), new_population|
            new_population[location] = cell.with(neighbors.at(location))
          end
        )
      end

      def self.for(locations, seed=RANDOM_SEED)
        seeded = [Cells::Cell.survive!, Cells::Cell.die!]
        population = locations.each_with_object({}) do |location, population|
          population[location] = seeded[rand(seed).to_i] || Cells::Cell.die!
        end
        new(population: population)
      end

      def to_h
        population.each_with_object({}) do |(location, cell), serialized|
          serialized[location.to_a] = cell.to_h
        end
      end
    end

  end
end
