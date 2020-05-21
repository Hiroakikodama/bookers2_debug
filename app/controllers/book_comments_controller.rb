class BookCommentsController < ApplicationController
	def create
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end

	def destroy
		BookComment.find_by(id: params[:id]).destroy
		redirect_to book_path(book)
	end

	private
	def comment_params
		params.require(:book_comment).permit(:comment)
	end
end
