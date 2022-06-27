module GameOfLife
  module Worlds
    World = Struct.new(:population, keyword_init: true) do
      DEFAULT_SEED = 5
      def self.build(seeds=DEFAULT_SEED)
        locations = 0.upto(seeds-1).flat_map do |y|
          0.upto(seeds-1).map do |x|
            Worlds::Location.for({x: x, y: y})
          end
        end

        new(population: Population.for(locations))
      end

      def to_h
        population.to_h
      end

      def of(new_population)
        self.class.new(population: new_population)
      end
    end
  end
end
