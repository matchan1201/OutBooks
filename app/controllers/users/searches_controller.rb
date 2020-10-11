class Users::SearchesController < ApplicationController
  def search
  	@range = params[:range] #送られてきたrangeの情報を@rangeに代入
  	search = params[:search] 
  	word = params[:word]

  	if @range == '1' #もし、送られてきた@rangeの情報が1ならば、@usersを表示
  		@users = User.search(search,word) #Userモデルのsearch(search,word)を持ってきている
  	else
  		@books = Book.search(search,word)
  	end
  end
end
