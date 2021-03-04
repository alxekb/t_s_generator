# frozen_string_literal: true

RSpec.describe TSGenerator::Tag do
  let(:lowercase_clause) { 'clause-1' }
  let(:uppercase_clause) { 'CLAUSE-1' }
  let(:lowercase_section) { 'section-1' }
  let(:uppercase_section) { 'SECTION-1' }
  let(:block) { 'sample text' }

  describe '#valid?' do
    describe 'when valid' do
      let(:lowercase_clause_tag) { described_class.new(lowercase_clause) }
      let(:uppercase_clause_tag) { described_class.new(uppercase_clause) }
      let(:lowercase_section_tag) { described_class.new(lowercase_section) }
      let(:uppercase_section_tag) { described_class.new(uppercase_section) }

      it 'returns correct state' do
        aggregate_failures do
          expect(lowercase_clause_tag.valid?).to be_truthy
          expect(uppercase_clause_tag.valid?).to be_truthy
          expect(uppercase_section_tag.valid?).to be_truthy
          expect(uppercase_section_tag.valid?).to be_truthy
        end
      end
    end

    describe 'when invalid' do
      let(:block_tag) { described_class.new(block) }

      it 'returns false' do
        expect(block_tag.valid?).to be_falsey
      end
    end
  end
end
