class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  has_many :spot_candidates
  has_many :spots, :through => :spot_candidates

  has_many :requests
  has_many :plans

  devise :trackable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :uid, :provider, :fb_name, :role_ids
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         fb_name:auth.info.name,
                         password:Devise.friendly_token[0,20]
                        )
      user.add_role :guest
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end