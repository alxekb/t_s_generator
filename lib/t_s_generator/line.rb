# frozen_string_literal: true

module TSGenerator
  # The TSGenerator::Line to parse content of the given template
  # Line is a core class of the Generator, it processes every line of the
  # template and converts it to a document line.
  #
  # Line called from TSGenerator::Template#transpile method.
  class Line
    class << self
      def to_text(args)
        new(args).to_text
      end
    end

    # @param [String] content
    def initialize(line)
      @blocks = []
      @line = line
    end

    # Transforms line and pass result to @block, whis is a container.
    def to_text
      @blocks << line if line.eql? '\n'
      line.match?(/\[(.*?)\]/) ? parse(line) : @blocks << line

      @blocks.join
    end

    private

    attr_accessor :line, :scanner

    def respond_to_missing?(method_sym, include_private = false)
      if method_sym.to_s =~ /^clause(.*)|section(.*)$/
        true
      else
        super
      end
    end

    def method_missing(method, *args)
      return method unless TSGenerator::Tag::ENUM.include? method.to_sym

      send method, args.first.to_i

      super
    end

    def clause(id)
      CLAUSES.find(-> { id }) { |c| c[:id].eql? id.to_i }.fetch(:text, '')
    end

    def section(id)
      section = SECTIONS.find(-> { id }) { |s| s[:id].eql? id.to_i }

      section.fetch(:clauses_ids, []).map do |cid|
        clause(cid)
      end.flatten.join(';')
    end

    def parse(line)
      line.split(/\[(.*?)\]/).map do |block|
        tag = tag_from(block)
        @blocks << (tag.valid? ? send(tag.type, tag.idx) : block)
      end
    end

    def tag_from(scanner_match)
      Tag.new(scanner_match.downcase.gsub(/[\[\]]/, ''))
    end

    def clause_ids
      line.scan(/CLAUSE-(\d)/i).flatten.map(&:to_i)
    end

    def section_ids
      line.scan(/SECTION-(\d)/i).flatten.map(&:to_i)
    end
  end
end
