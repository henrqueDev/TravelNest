module CarouselHelper
  def carousel_for(images, identifier = SecureRandom.hex(6))
    Carousel.new(self, images, identifier).html
  end

  class Carousel
    def initialize(view, images, identifier)
      @view, @images, @identifier = view, images, identifier
    end

    def html
      content = safe_join([indicators, slides, controls])
      content_tag(:div, content, id: @identifier, class: 'carousel slide')
    end

    private

    attr_accessor :view, :images, :identifier
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = images.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: { 
          target: "##{@identifier}", 
          slide_to: index
        }
      }

      content_tag(:li, '', options)
    end

    def slides
      items = images.map.with_index { |image, index| slide_tag(image, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(image, is_active)
      options = {
        class: (is_active ? 'carousel-item  active slide' : 'carousel-item slide'),
        style: 'object-fit: cover; width: 100%; height: 100%;'
      }
      #image_tag(image, class: "card-img-top d-block w-100 aspect-ratio", style: "object-fit: cover;", options)
      content_tag(:div, image_tag(image, class: "card-img-top" , style:'width:23vw; height:22vh;'), options)
    end

    def controls
      safe_join([
        control_tag('left', "##{@identifier}", 'prev'),
        control_tag('right', "##{@identifier}", 'next')
      ])
    end

    def control_tag(direction, target, slide)
      options = {
        class: "carousel-control-#{slide}",
        href: target,
        role: 'button',
        data: { slide: slide }
      }

      icon = content_tag(:i, '', class: "carousel-control-#{slide}-icon")
      control = content_tag(:a, icon, options)
    end
  end
end