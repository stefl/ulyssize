class Page
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :body

  def self.generate
    page_text = Markov.new.generate_page("ulysses_ascii.txt")
    Page.create(:body => page_text)
  end
end
