class UsersController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books=Book.all
      render :index
    end
  end

  def index
    @book=Book.new
    @users=User.all
    @user=current_user

  end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books

  end

  def edit
    @user=User.find(params[:id])
    if @user==current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

private

 def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
 end

 def book_params
    params.require(:book).permit(:title, :body)
  end

end