class User < ActiveRecord::Base
  
  def self.find_or_create_from_auth(auth)
    user = find_or_create_by(
    provider: auth.provider,
    uid:  auth.uid 
    )
    
    user.nickname = auth.info.nickname
    user.name = auth.info.name
    user.location = auth.info.location
    user.image_url = auth.info.image_url
    user.token = auth.credentials.token
    user.save!
    
    user
  end
end
