require 'elasticsearch/model'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

#   after_commit on: [:create] do
#   __elasticsearch__.create_index! force: true
# end

# after_commit on: [:update] do
#   __elasticsearch__.index_document
# end

# after_commit on: [:destroy] do
#   __elasticsearch__.delete_document
# end 
end
