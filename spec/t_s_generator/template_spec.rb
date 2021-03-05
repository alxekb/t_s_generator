# frozen_string_literal: true

RSpec.describe TSGenerator::Template do
  let(:template) { file_fixture('template.txt').read }
  let(:document) { file_fixture('document.txt').read }

  describe '#transpile' do
    subject { described_class.new }

    it 'returns transpiled text with all newlines' do
      expect(subject.transpile).to eq document
    end
  end
end
