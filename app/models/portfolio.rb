class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body

  # def self.crickettips
  #   where(subtitle: "Cricket Tips")
  # end

  # custom scopes for specific items to be popped up on index page instead of Portfolio.all, you can say Portfolio.crickettips
  scope :cricketTips, -> { where(subtitle: "Cricket Tips") }

  #set default values:
  after_initialize  :set_defaults

  def set_defaults
    self.thumb_image ||= "https://www.worldometers.info//img/flags/small/tn_pk-flag.gif"
    self.main_image ||= "https://www.worldometers.info//img/flags/small/tn_pk-flag.gif"
  end

  # '||=' operator is a short-cut to check if the value is nill, then replace, or else not.
  # other way of setting defaults is basically through db/schema and go there and write defaul: "sadfsdf", infront of the value.
end
