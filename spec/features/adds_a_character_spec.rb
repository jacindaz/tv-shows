require 'rails_helper'

feature 'user adds a new TV show character', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

  #Acceptance Criteria:
  # * I can access a form to add a character on a TV show's page
  # * I must specify the character's name and the actor's name
  # * I can optionally provide a description
  # * If I do not provide the required information, I receive an error message
  # * If the character already exists in the database, I receive an error message

  scenario 'user adds a new TV show character' do

    attrs_tv = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    tv_show = TelevisionShow.create(attrs_tv)

    attrs = {
      character_name: "Daenerys Targaryen",
      actor_name: "Emilia Clarke",
      description: "Daenerys Targaryen is the daughter of King Aerys II Targaryen and is one of the last surviving members of House Targaryen.",
      tv_show_id: tv_show.id
    }

    character = Character.new(attrs)

    visit "/television_shows/#{tv_show.id}"
    #save_and_open_page

    fill_in 'Character name', with: character.character_name
    fill_in 'Actor name', with: character.actor_name
    fill_in 'Description', with: character.description
    click_on 'Submit Character'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.character_name
    expect(page).to_not have_content character.description
  end

  scenario 'without required attributes' do

    attrs_tv = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    tv_show = TelevisionShow.create(attrs_tv)

    visit "/television_shows/#{tv_show.id}"
    click_on 'Submit Character'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "Character info cannot be blank."
  end

  scenario 'user cannot add a character that is already in the database' do

    attrs_tv = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    tv_show = TelevisionShow.create(attrs_tv)

    attrs = {
      character_name: "Daenerys Targaryen",
      actor_name: "Emilia Clarke"
    }

    character = Character.new(attrs)

    visit "/television_shows/#{tv_show.id}"
    fill_in 'Character name', with: character.character_name
    fill_in 'Actor name', with: character.actor_name
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "Character already exists."
  end


end
