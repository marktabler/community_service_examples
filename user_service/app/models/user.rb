class User < ActiveRecord::Base

  def password=(value)
    generate_salt
    self.encrypted_password = (Digest::SHA256.new << (value + salt)).hexdigest
  end

  def password_matches?(value)
    encrypted_password == (Digest::SHA256.new << (value + salt)).hexdigest
  end

  def as_json(params={})
    super(params.merge( { except: private_fields } ))
  end

  private

  def private_fields
    [:encrypted_password, :salt]
  end

  def generate_salt
    update_attribute(:salt, SecureRandom.hex)
  end
end
