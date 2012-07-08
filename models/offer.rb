class Offer
  include DataMapper::Resource

  property :id,				Serial
  property :title,			String
  property :description,	Text
  property :company_url,	String
  property :email,			String
  property :telephone,		String
  property :created_at,		DateTime
  property :updated_at,		DateTime
  
end