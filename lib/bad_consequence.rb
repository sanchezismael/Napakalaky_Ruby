#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "treasure_kind.rb"
module Napakalaki
class BadConsequence
  
  @@MAXTREASURES = 10
  
  def initialize 
  end
  
#    def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, 
#        someHiddenTreasures)
#      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures,Array.new,Array.new,
#      false)      
#    end
#    
#    def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,
#      someSpecificHiddenTreasures)
#      new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,
#      false)
#    end
#    
#    def self.newDeath(aText, death)
#      new(aText,0,0,0,Array.new,Array.new,death)
#    end
    
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
    
   
    
#    def to_s
#      "Name: #{@text},Niveles perdidos: #{@levels},Tesoros visibles perdidos: #{@nVisibleTreasures},Tesoros ocultos perdidos: #{@nHiddenTreasures},Muerto: #{@death}, Tesoros especificos visibles: #{@specificVisibleTreasures},Tesoros especificos ocultos: #{@specificHiddenTreasures}"
#   
#    end
    
#    private_class_method :new
    
#    un_bad = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
#    puts un_bad.to_s
#    
#    puts "Un_Bad: #{un_bad.specificVisibleTreasures}"
#    puts "Un_Bad: #{un_bad.specificHiddenTreasures}"
end
end
