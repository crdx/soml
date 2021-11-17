require_relative 'soml/version'
require_relative 'soml/util'
require_relative 'soml/document'
require_relative 'soml/field'

module SOML
    def self.root_dir
        File.expand_path('..', __dir__)
    end
end
