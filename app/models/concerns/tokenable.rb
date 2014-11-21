module Tokenable
  extend ActiveSupport::Concern
  
  included do
    
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Token

    token :contains => :alphanumeric, :length => 6
    
    field :provenance, type: Hash
  end
end
