module GameOfLife
  module Worlds
    module Cells
      Cell = Struct.new(:status, keyword_init: true) do
        def self.survive!
          new(status: :alive)
        end

        def self.die!
          new(status: :dead)
        end

        def alive?
          status == :alive
        end

        def dead?
          status == :dead
        end

        def with(neighbors)
          alive_neighbors_count = neighbors.select(&:alive?).size

          if alive? and (alive_neighbors_count == 2 or alive_neighbors_count == 3)
            return self.class.survive!
          end

          if dead? and (alive_neighbors_count == 3)
            return self.class.survive!
          end

          self.class.die!
        end

        def to_s
          return '*' if alive?
          ''
        end
      end
    end

  end
end
