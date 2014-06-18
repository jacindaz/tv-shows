class Character < ActiveRecord::Base
  validates :character_name, presence: true, uniqueness: { scope: :actor_name }
  validates :actor_name, presence: true
  validates :tv_show_id, numericality: { only_integer: true }

  belongs_to :tv_show
end
