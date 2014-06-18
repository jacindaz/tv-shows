require 'rails_helper'

feature "delete a character", %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
  } do

# Acceptance Criteria:
# * I can delete a character from the database
# * If the record is not successfully deleted, I receive an error message

  scenario "user deletes a character from the database" do
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

    character = Character.create(attrs)

    visit "/television_shows/#{tv_show.id}/characters/#{character.id}"
    click_on "Delete Character"

    expect(page).to have_content "Character deleted."

  end

  scenario "user will receive an error message if not successfully deleted" do

  end

end
