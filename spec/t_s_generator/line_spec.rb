# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::TSGenerator::Line do
  let(:line_with_tags) do
    'Is made of [CLAUSE-4] and [clause-3] and [section-1] why not?'
  end
  let(:plaintext) { 'This document is made of plaintext.' }
  let(:output) do
    %w[
      Is made of
      The white horse is white
      and
      And dies
      and
      The quick brown fox;jumps over the lazy dog why not?
    ].join(' ')
  end

  describe '#to_text' do
    describe 'text with tags' do
      subject { described_class.new line_with_tags }

      it 'returns transpiled string.' do
        expect(subject.to_text).to eq output
      end
    end

    describe 'with a plaintext' do
      subject { described_class.new(plaintext) }
      it 'returns the plaintext.' do
        expect(subject.to_text).to eq plaintext
      end
    end
  end
end
