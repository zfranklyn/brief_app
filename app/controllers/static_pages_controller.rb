class StaticPagesController < ApplicationController

  def about
  end

  def contact
  end

  def mission
  end

  def stories
	@articles = Article.order("created_at desc").limit(5)
  end


end
