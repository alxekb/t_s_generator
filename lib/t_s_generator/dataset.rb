# frozen_string_literal: true

# The *TSGenerator* module
module TSGenerator
  # Clauses tag list. Here is a sample dataset to descrbe functionality.
  # Clauses are hases with id and text keys.
  CLAUSES = [
    { "id": 1, "text": 'The quick brown fox' },
    { "id": 2, "text": 'jumps over the lazy dog' },
    { "id": 3, "text": 'And dies' },
    { "id": 4, "text": 'The white horse is white' }
  ].freeze

  # Sections tag list
  # Sections are hashes with id and clauses_ids keys.
  SECTIONS = [{ "id": 1, "clauses_ids": [1, 2] }].freeze
end
