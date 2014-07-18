class StaticPagesController < ApplicationController

  def about
  end

  def contact
  end

  def mission
  end

  def stories
	# @articles = Article.order("created_at desc").limit(6)
	@articles = Article.order("created_at desc").limit(8)
  end


end
