class BookCommentsController < ApplicationController
	def create
		@comment = BookComment.new(book_comment_params)
		@book = Book.find(params[:book_id])
		@comment.book_id = @book.id
		@comment.user_id = current_user.id
		@comment.save
		redirect_to request.referrer
	end

	def destroy
	    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    	redirect_to book_path(params[:book_id])
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
