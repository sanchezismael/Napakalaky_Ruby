#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "treasure_kind.rb"
module Napakalaki
class BadConsequence
  
  @@MAXTREASURES = 10
    
    def initialize(t,l)
      @text = t
      @levels = l
    end
    private_class_method :new
    
    attr_reader :text, :levels
    def isEmpty()
      raise NotImplementedError.new
    end
    
    def substractVisibleTreasure(t)
      raise NotImplementedError.new
    end
    

    def substractHiddenTreasure(t)
      raise NotImplementedError.new
    end
    
    def adjustToFitTreasureLists(v, h)
      raise NotImplementedError.new
    end
    
    def self.getmaxtreasures
      @@MAXTREASURES
    end
    
end
end
