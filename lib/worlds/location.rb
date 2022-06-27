module GameOfLife
  module Worlds
    Location = Struct.new(:x, :y, keyword_init: true) do
      def self.for(attrs)
        new(x: attrs[:x], y: attrs[:y])
      end

      def north
        self.class.new(x: x, y: y - 1)
      end

      def south
        self.class.new(x: x, y: y + 1)
      end

      def east
        self.class.new(x: x - 1, y: y)
      end

      def west
        self.class.new(x: x + 1, y: y)
      end

      def to_h
        { x: 0, y: 0 }
      end
    end

  end
end
