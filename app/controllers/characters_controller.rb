class CharactersController < ApplicationController

  def index
    @characters = Character.all
    @tv_show = TelevisionShow.find(params[:television_show_id])
    @title = "All Characters"
  end

  def show
    @tv_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.find(params[:id])
    @title = "Learn about #{@character.character_name}"
  end

  def new
    @character = Character.new
  end

  def create
    @title = "Create a new Character"
    @tv_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    #binding.pry
    @character.tv_show_id = @tv_show.id

    if @character.save
      flash[:notice] = "Success!"
      redirect_to "/television_shows/#{@character.tv_show_id}/characters"
    elsif @character.present?
      flash[:notice] = "Character info cannot be blank."
      redirect_to '/television_shows'
    else
      flash[:notice] = "I'm sorry, the character couldn't be saved."
      redirect_to '/television_shows'
    end
  end

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description)
  end

end
