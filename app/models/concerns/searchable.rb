require 'mongoid-elasticsearch'

Mongoid::Elasticsearch.autocreate_indexes = false
Mongoid::Elasticsearch.prefix = ENV["MONGOID_ENVIRONMENT"] || ""

if ENV["ELASTICSEARCH_URL"]
  Mongoid::Elasticsearch.client_options = { url: ENV["ELASTICSEARCH_URL"] }
end

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

    # Do something like #name_prefix_search('FOR') to get all names starting with FOR
    def self.name_prefix_search(str)
      
      scroll = es.client.search index: es.index.name,
                         scroll: '5m',
                         search_type: 'scan',
                         body: {
                           query: {
                             match_phrase_prefix: {
                               name: str
                             }
                           }
                         }
      
      results = []
      loop do
        scroll = es.client.scroll(scroll_id: scroll['_scroll_id'], scroll: '5m')
        break if scroll['hits']['hits'].empty?        
        results.concat scroll['hits']['hits'].map { |x| x['_source']['name'] }
      end
      results.uniq
    end    
    
  end    
end
