class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  mount_uploader :profile_image, ProfileImageUploader

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  validates :username, uniqueness: { case_sensitive: false }

  # Override for Devise to allow username OR email to auth
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # Facebook Omniauth
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         biography: auth.info.description,
                         location: auth.info.location,
                         username: auth.info.nickname,
                         password: Devise.friendly_token[0,20]
                         # TODO profile image # http://stackoverflow.com/questions/14009745/railscarrierwave-with-omniauth # key = :image
                        )
    end
    user
  end
end
