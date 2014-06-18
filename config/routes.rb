TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create] do
    resources :characters
  end
end


=begin

CURRENT ROUTES

                       Prefix Verb URI Pattern                                                    Controller#Action
   television_show_characters GET  /television_shows/:television_show_id/characters(.:format)     characters#index
                              POST /television_shows/:television_show_id/characters(.:format)     characters#create
new_television_show_character GET  /television_shows/:television_show_id/characters/new(.:format) characters#new
    television_show_character GET  /television_shows/:television_show_id/characters/:id(.:format) characters#show
             television_shows GET  /television_shows(.:format)                                    television_shows#index
                              POST /television_shows(.:format)                                    television_shows#create
          new_television_show GET  /television_shows/new(.:format)                                television_shows#new
              television_show GET  /television_shows/:id(.:format)                                television_shows#show

=end

