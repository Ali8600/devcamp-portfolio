class Skill < ApplicationRecord
  includes Placeholder

  after_initialize :set_defaults

  def set_defaults
    badge ||= Placeholder.image_generator(height: '250', width: '250')
  end
end
