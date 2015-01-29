require 'mongoid-elasticsearch'

Mongoid::Elasticsearch.autocreate_indexes = false
Mongoid::Elasticsearch.prefix = ENV["MONGOID_ENVIRONMENT"] || ""

module Searchable
  
  extend ActiveSupport::Concern
  
  included do
    
    include Mongoid::Elasticsearch
  
    elasticsearch!({
      index_options: {
        settings:{
          index:{
            analysis:{
              analyzer:{
                analyzer_startswith:{
                  tokenizer:"keyword",
                  filter:"lowercase"
                }
              }
            }
          }
        },
        mappings: {
          name.downcase.to_sym => {
            properties:{
              name:{
                search_analyzer:"analyzer_startswith",
                index_analyzer:"analyzer_startswith",
                type:"string"
              }
            }
          }
        }
      }
    })
  
    # Do something like #name_prefix_search('FOR') to get everything starting with FOR
    def self.name_prefix_search(str)
      es.search(index: es.index.name, body: {query: {match_phrase_prefix: {name: str}}})
    end    
    
  end    
end