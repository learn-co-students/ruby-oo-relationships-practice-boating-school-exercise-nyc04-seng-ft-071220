require 'pry'
require_relative "boatingtest.rb" 
require_relative "instructor"

class Instructor

    attr_accessor 

    @@all = []

    def initialize(name)
            @name = name 
            @@all << self
    end

    def self.all
        @@all
    end
    
end
