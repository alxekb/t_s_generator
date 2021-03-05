# frozen_string_literal: true

module TSGenerator
  # The TSGenerator::Tag class is responsible to match known tags types
  # We need only #valid? method here.
  class Tag
    # We can process only this kind of tags
    ENUM = %i[clause section].freeze

    attr_reader :type, :idx

    def initialize(*args)
      @type, @idx = args[0].split('-')
    end

    # Valudation of a tag. Line tries to convert all line blocks to tags
    # but returns line block if Tag is unsuccessfull.
    def valid?
      ENUM.include? @type.downcase.to_sym
    end
  end
end
