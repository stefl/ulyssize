class Page
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :body

end
