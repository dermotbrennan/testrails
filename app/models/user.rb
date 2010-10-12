class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  def is_admin?
    login == 'admin' || is_superadmin?
  end

  def is_superadmin?
    login == 'superadmin'
  end
end
