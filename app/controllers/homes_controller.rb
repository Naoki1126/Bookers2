class HomesController < ApplicationController

	def home
	end

	def about
		@books = Book.all
	end
end


