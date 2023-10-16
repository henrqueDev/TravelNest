require 'rails_helper'
require_relative '../../app/helpers/carousel_helper'

RSpec.describe CarouselHelper do
  let(:view) { double('view') }
  let(:images) { ['image1.jpg', 'image2.jpg'] }
  let(:identifier) { 'identifier' }
  let(:style) { 'width:23rem; height:15rem;' }
  let(:carousel_instance) { described_class::Carousel.new(view, images, identifier, style) }

  describe '#carousel_for' do
    it 'returns HTML for the carousel' do
      allow(described_class::Carousel).to receive(:new).and_return(carousel_instance)
      allow(carousel_instance).to receive(:html).and_return('<div>carousel HTML</div>')

      result = helper.carousel_for(images, identifier)

      expect(result).to eq('<div>carousel HTML</div>')
    end
  end
end