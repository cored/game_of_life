## Summary

Basic implementation of an engine to support *Conway's Game Of Life*.

The engine implements the core domain while following a discovery approach to testing.

### Domain

#### Use Cases

- `GameOfLife` - handles simulation
- `GameOfLife::Worlds::Replace` - handle world replacement for a new population
- `GameOfLife::Worlds::Cells::Replace` - replace a specific cell in the grid, calculating its neighbors.

#### Values

- `Worlds::World` - represents the world
- `Worlds::Cells::Cell` - represents the state of a point in the world
- `Worlds::Location` - coordinate in which a `Cell` exist.
- `Worlds::Population` - the combination between a `Location` and a `Cell.`
- `Worlds::Cells::Neighbor` - the representation of neighbors in every direction.

### Development

#### Run specs

`$ rspec `
