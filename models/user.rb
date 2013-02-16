class User
  include DataMapper::Resource

  property :id,     Serial
  property :login,  String
  property :token,  String
  property :secret, String
end
