class LettersController < ApplicationController

	def index
		@letters = Letter.all
	end

	def show
  		@letter = Letter.find(params[:id])
	end

	def new 
		@letters = Letter.new
	end

	def create
  		@letters = Letter.new(letter_params)
  		respond_to do |format|
  		if current_user.letters.push @letters
	       format.html { redirect_to user_letters_path(current_user), notice: 'Post was successfully created.' }
	       format.json { render :show, status: :created, location: @letters }

     	else
	       format.html { render :new }
	       format.json { render json: @user.errors, status: :unprocessable_entity }
     	end
 	end
 

	def edit
  		@letter = Letter.find(params[:id])
	end

	def update
  		@letter = Letter.find(params[:id])

  		if @letter.update_attributes(letter_params)
    		redirect_to user_letters_path(current_user)
  		else
    		render :edit
  		end
	end

	def destroy
  		@letter = Letter.find(params[:id])
  		@letter.destroy
  		redirect_to user_letters_path(current_user)
	end

end

	private
		def letter_params
  			params.require(:letter).permit(:reciever, :title, :content)
		end
	end
