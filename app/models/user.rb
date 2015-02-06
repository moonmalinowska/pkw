class User < ActiveRecord::Base
  has_one :district
  ROLES = %i[Okręgowy Centralny]

  validates :password, :on => :create, presence: true
  validates_confirmation_of :password
            #unless: Proc.new { |a| a.password.blank? }
  validates :login, uniqueness: true, presence: true,
            length: {within: 6..15}

  acts_as_authentic do |config|
    config.validate_login_field = false
    config.validate_password_field = false
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end



end
