require 'rails_helper'

feature "user views a TV show's character's details", %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can learn more about it
}  do

# Acceptance Criteria:
# * I can see a the show's title, network,
#      the years it ran, and a synopsis
# * For each character, I can see the character's name,
#      actor's name, and the character's description

  scenario "user views a character's details" do
    attrs_tv = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    tv_show = TelevisionShow.create(attrs_tv)
    character = Character.create(character_name: "Daenerys Targaryen",
      actor_name: "Emilia Clarke", description: "The Queen of awesome.",
      tv_show_id: tv_show.id)

    visit "/television_shows/#{tv_show.id}/characters/#{character.id}"

    expect(page).to have_content tv_show.title
    expect(page).to have_content tv_show.network
    expect(page).to have_content tv_show.years
    expect(page).to have_content tv_show.synopsis

    expect(page).to have_content character.character_name
    expect(page).to have_content character.actor_name
    expect(page).to have_content character.description
  end

  end
