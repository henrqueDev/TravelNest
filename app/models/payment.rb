class Payment
    attr_accessor :url
  
    def initialize(url)
      @url = url
    end
  
    def get_url
      @url
    end
  end