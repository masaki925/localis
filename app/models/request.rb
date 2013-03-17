class Request < ActiveRecord::Base
  attr_accessible :title
  has_many :plans
  # TODO: devise
  #has_many :candidates, conditions: { user_id: current_user }

  has_many :candidates do
    def filter( user_id )
      find(:all, conditions: { user_id: user_id } )
    end
  end
end
