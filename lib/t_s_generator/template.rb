# frozen_string_literal: true

# TSGenerator module
module TSGenerator
  # The TSGenerator::TEMPLATE given example
  class Template
    # The Default template from README.md
    DEFAULT_TEMPLATE = <<~LINE
      A T&C Document

      This document is made of plaintext.
      Is made of [CLAUSE-3].
      Is made of [CLAUSE-4].
      Is made of [SECTION-1].

      Your legals.
    LINE

    attr_reader :template
    # @param [String] tempalte text
    def initialize(template = DEFAULT_TEMPLATE)
      @template = template
    end

    # Core feature of the Generator.
    #
    # It reads template line by line and passes every line to Line class.
    # If it has an empty line it returns an empty line, if it has a line with a
    # plain text it returns that plain text, if it has a line with tags it
    # returns transpiled line.
    def transpile
      template.lines.map { |line| Line.new(line).to_text }.join
    end
  end
end
