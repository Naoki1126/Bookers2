class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.new(book_comment_params)
		@comment.book_id = @book.id
		@comment.save
		


	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find_by(
			user_id: current_user.id,
			book_id: params[:book_id])
		
		@book_comment.destroy
		
	end
private
def book_comment_params
	params.require(:book_comment).permit(:comment, :user_id, :book_id)
end
end

