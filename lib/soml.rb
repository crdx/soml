require_relative 'soml/version'
require_relative 'soml/util'
require_relative 'soml/document'
require_relative 'soml/field'

module SOML
    def self.root
        File.expand_path('../..', __FILE__)
    end
end
