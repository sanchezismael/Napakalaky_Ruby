#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "treasure_kind.rb"
module Napakalaki
class BadConsequence
      attr_reader :text, :levels, :nVisibleTreasures, 
                  :nHiddenTreasures, :death, :specificHiddenTreasures,
                  :specificVisibleTreasures
  
  @@MAXTREASURES = 10
  
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
    
    def self.newDeath(aText, death)
      new(aText,0,0,0,nil,nil,death)
    end
    
    def isEmpty()
      if(@levels == 0 && @nVisibleTreasures ==0 && @nHiddenTreasures == 0 && !@death)
        if(@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?)
          true
        end
      end
    end
    
    def substractVisibleTreasure(t)
      if @specificVisibleTreasures.include?(t.type)
        @specificVisibleTreasures.delete(t.type)
      elsif nVisibleTreasures > 0
        @nVisibleTreasures -= 1
      end
    end
    

    def substractHiddenTreasure(t)
      if @specificHiddenTreasures.include?(t.type)
        @specificHiddenTreasures.delete(t.type)
      elsif nHiddenTreasures > 0
          @nHiddenTreasures -= 1
      end
    end
    
    def adjustToFitTreasureLists(v,h)
      bc = BadConsequence.newDeath('',false)
      if @nVisibleTreasures > 0
        if @nVisibleTreasures > v.size
          bc.nVisibleTrasures = v.size
        else
          bc.nVisibleTrasures = @nVisibleTreasures
        end
      
      else 
        @specificVisibleTreasures.each do |specificVisibleTreasure|
          v.each do |treasure|
            if treasure.type == specificVisibleTreasure
              bc.specificVisibleTreasures << specificVisibleTreasure
            end
          end
        end
      end
      
      if @nHiddenTreasures > 0
        if @nHiddenTreasures > h.size
          bc.nHiddenTrasures = h.size
        else
          bc.nHiddenTrasures = @nHiddenTreasures
        end
      
      else 
        @specificHiddenTreasures.each do |specificHiddenTreasure|
          h.each do |treasure|
            if treasure.type == specificHiddenTreasure
              bc.specificHiddenTreasures << specificHiddenTreasure
            end
          end
        end
      end

    end
    
    def self.getmaxtreasures
      @@MAXTREASURES
    end
    
   
    
    def to_s
      "Mal rollo: #{@text}
      Niveles perdidos: #{@levels}
      Tesoros visibles perdidos: #{@nVisibleTreasures}
      Tesoros ocultos perdidos: #{@nHiddenTreasures}
      Muerto: #{@death} 
      Tesoros especificos visibles: #{@specificVisibleTreasures}
      Tesoros especificos ocultos: #{@specificHiddenTreasures}"
      
      private_class_method :new 
    end
    
#    un_bad = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
#    puts un_bad.to_s
#    
#    puts "Un_Bad: #{un_bad.specificVisibleTreasures}"
#    puts "Un_Bad: #{un_bad.specificHiddenTreasures}"
end
end
