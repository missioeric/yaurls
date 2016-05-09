class Link < ActiveRecord::Base
  after_create :shorten_url

  def shorten_url
    self.short_url = (self.id.to_s + ((1+rand(8)).to_s)).reverse.to_i.to_s(36)
    self.save
  end

end
