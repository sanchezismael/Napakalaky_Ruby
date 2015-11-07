#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "treasure_kind.rb"
class BadConsequence
      attr_accessor :text, :levels, :nVisibleTreasures, 
                  :nHiddenTreasures, :death, :specificHiddenTreasures,
                  :specificVisibleTreasures
  
  MAXTREASURES = 10
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
    someSpecificVisibleTreasures, someSpecificHiddenTreasures,death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @death = death
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
  end
  
    def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, 
        someHiddenTreasures)
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures,nil,nil,
      false)      
    end
    
    def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,
      someSpecificHiddenTreasures)
      new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,
      false)
    end
    
    def self.newDeath(aText)
      new(aText,0,0,0,nil,nil,true)
    end
    
    def isEmpty()
      if(@levels == 0 && @nVisibleTreasures ==0 && @nHiddenTreasures == 0 && !@death)
        if(@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?)
          true
        end
      end
    end
    
    def getLevels()
      
    end
    
    def getNVisibleTreasures()
      
    end
    
    def getNHiddenTreasures()
      
    end
    
    def getSpecificHiddenTreasures()
      
    end
    
    def getSpecificVisibleTreasures()
      
    end
    
    def substractVisibleTreasure(t)
      
    end
    
    def substractHiddenTreasure(t)
      
    end
    
    def adjustToFitTreasureLists(v,h)
      
    end
    
    def to_s
      "Mal rollo: #{@text}
      Niveles perdidos: #{@levels}
      Tesoros visibles perdidos: #{@nVisibleTreasures}
      Tesoros ocultos perdidos: #{@nHiddenTreasures}
      Muerto: #{@death} 
      Tesoros especificos visibles: #{@specificVisibleTreasures}
      Tesoros especificos ocultos: #{@specificHiddenTreasures}"
    end
    
#    un_bad = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
#    puts un_bad.to_s
#    
#    puts "Un_Bad: #{un_bad.specificVisibleTreasures}"
#    puts "Un_Bad: #{un_bad.specificHiddenTreasures}"
  
  private_class_method :new 
end
