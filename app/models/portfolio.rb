class Portfolio < ApplicationRecord
  includes Placeholder
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attributes| attributes['name'].blank? }
  validates_presence_of :title, :subtitle, :body, :thumb_image

  # def self.crickettips
  #   where(subtitle: "Cricket Tips")
  # end

  # custom scopes for specific items to be popped up on index page instead of Portfolio.all, you can say Portfolio.crickettips
  scope :cricketTips, -> { where(subtitle: "Cricket Tips") }

  #set default values:
  after_initialize  :set_defaults

  def set_defaults
    self.thumb_image ||= Placeholder.image_generator(height:'200',width:'100')
    self.main_image ||= Placeholder.image_generator(height:'300',width:'200')
  end

  # '||=' operator is a short-cut to check if the value is nill, then replace, or else not.
  # other way of setting defaults is basically through db/schema and go there and write defaul: "sadfsdf", infront of the value.
end
