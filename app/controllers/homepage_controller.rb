class HomepageController < ApplicationController
  

  cache_store
  
  def index
    render template: 'homepage/index'
  end
  

end
