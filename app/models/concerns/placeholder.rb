module Placeholder
  # includes in some of the helper files to act as concern
  # concerns make modules that can be used across models
  # Modules are collections of methods and constants. They cannot generate instances, like classes.
  extend ActiveSupport::Concern
  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
end