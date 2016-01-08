#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "treasure_kind.rb"
module Napakalaki
  
  class SpecificBadConsequence < BadConsequence
    
    attr_reader :specificHiddenTreasures, :specificVisibleTreasures
    
    def initialize (aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      super(aText,someLevels)
      @specificHiddenTreasures = someSpecificHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures
    end
    public_class_method :new
    
    def isEmpty()
      if(@specificHiddenTreasures.size == 0 && @specificVisibleTreasures.size == 0)
        true
      end  
    end
    
    def substractVisibleTreasure(t)
      if @specificVisibleTreasures.include?(t.type)
        @specificVisibleTreasures.delete(t.type)
      end
    end
    
    def substractHiddenTreasure(t)
      if @specificHiddenTreasures.include?(t.type)
        @specificHiddenTreasures.delete(t.type)
      end
    end
    
    def adjustToFitTreasureLists(v, h)
      
      tesoros_visibles = Array.new
      tesoros_ocultos = Array.new
      bc = NumericBadConsequence.new('',0,0,0)
      
      esta = false
      
      if @specificVisibleTreasures == nil
        @specificVisibleTreasures = Array.new
      end
      
      @specificVisibleTreasures.each do |specificVisibleTreasure|
        v.each do |treasure|	
          if treasure.type == specificVisibleTreasure
            esta = true
          end
          if(esta)
            tesoros_visibles << specificVisibleTreasure
          end             
          
        end  
      end
      
      if @specificHiddenTreasures == nil
        @specificHiddenTreasures = Array.new
      end
      
      @specificHiddenTreasures.each do |specificHiddenTreasure|
        h.each do |treasure|	
          if treasure.type == specificHiddenTreasure
            esta = true
          end
          if(esta)
            tesoros_ocultos << specificHiddenTreasure
          end             
          
        end  
      end
      
      bc = SpecificBadConsequence.new(@text,0,tesoros_visibles,tesoros_ocultos)
      
      return bc  
    end
    
    def to_s
      "Name: #{@text},Niveles perdidos: #{@levels},Muerto: #{@death}, Tesoros especificos visibles: #{@specificVisibleTreasures},Tesoros especificos ocultos: #{@specificHiddenTreasures}"
    end
    
  end
end
