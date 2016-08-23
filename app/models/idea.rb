class Idea < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_attached_file :avatar, styles: { large: "500X500>", medium: "300x300!", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_from_url(url)
    self.avatar = open(url)
  end
end
