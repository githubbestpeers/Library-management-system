# require 'elasticsearch/model'

#Elasticsearch::Model.client = Elasticsearch::Client.new log:true, transpost_options:{request:{timeout:5}}
# class Book < ActiveRecord::Base
#   include Elasticsearch::Model
#   include Elasticsearch::Model::Callbacks
# end

# # Index creation right at import time is not encouraged.
# # Typically, you would call create_index! asynchronously (e.g. in a cron job)
# # However, we are adding it here so that this usage example can run correctly.
# Book.__elasticsearch__.create_index!
# Book.import

# @books = Book.search('foobar').records