# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
      attr_accessor :text, :levels, :nVisibleTreasures, 
                  :nHiddenTreasures, :death, :specificHiddenTreasures,
                  :specidicVisibleTreasures
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
    someSpecificVisibleTreasures, someSpecificHiddenTreasures,death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @death = death
    @specificHiddenTreasures = someSpecificVisibleTreasures
    @specidicVisibleTreasures = someSpecificHiddenTreasures
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
    
    def to_s
      "Mal rollo: #{@text} \n Niveles perdidos: #{@levels} \n Tesoros visibles
      perdidos: #{@nVisibleTreasures} \n Tesoros ocultos perdidos: #{@nHiddenTreasures}
      \n Muerto: #{@death} \n Tesoros especificos visibles: #{@specificHiddenTreasures}
      \n Tesoros especificos ocultos: #{@specificHiddenTreasures}"
    end
    
    un_bad = BadConsequence.newDeath('Malo')
    puts un_bad.to_s
  
  
  private_class_method :new 
end
