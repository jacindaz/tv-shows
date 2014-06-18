require 'rails_helper'

feature 'views a list of characters', %Q{
    As a site visitor
    I want to view a list of people's favorite TV characters
    So I can find wonky characters to watch
  } do

# Acceptance Criteria:
# * I can see a list of all the characters
# * The character's name and the TV show it is associated with are listed

  scenario 'user sees list of all characters' do

    attrs_tv = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    tv_show = TelevisionShow.create(attrs_tv)

    characters = []
    character_attrs = [
      {character_name: "Daenerys Targaryen", actor_name: "Emilia Clarke", tv_show_id: tv_show.id},
      {character_name: "Arya Stark", actor_name: "Maisie Williams", tv_show_id: tv_show.id},
      {character_name: "Sansa Stark", actor_name: "Sophie Turner", tv_show_id: tv_show.id}
    ]

    character_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    #binding.pry

    visit "/television_shows/#{tv_show.id}/characters"
    characters.each do |character|
      expect(page).to have_content character.character_name
      expect(page).to have_content tv_show.title
    end

  end

end
