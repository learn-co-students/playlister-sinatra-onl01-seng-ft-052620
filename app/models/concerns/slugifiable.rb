module Slugifiable
  def slug
    slug = self.name.gsub(" ","-").downcase
  end

  def find_by_slug(slug)
    self.all.find {|t| t.slug == slug}
  end
end 
