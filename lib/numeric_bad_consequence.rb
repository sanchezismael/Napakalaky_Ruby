#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "treasure_kind.rb"
module Napakalaki

  class NumericBadConsequence < BadConsequence
  
    attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures
  
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      super(aText,someLevels)
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
    end
  
    def isEmpty()
      if(@levels == 0 && @nVisibleTreasures == 0 && @nHiddenTreasures == 0)
        true
      end
    end
  
    def substractVisibleTreasure
      if nVisibleTreasures > 0
        @nVisibleTreasures -= 1
      end
    end
  
    def substractHiddenTreasure
      if nHiddenTreasures > 0
        @nHiddenTreasures -= 1
      end
    end
  
    def adjustToFitTreasureLists(v, h)
    
      nv = 0
      nh = 0
      bc = NumericBadConsequence.new('',0,0,0)
    
      if @nVisibleTreasures > v.size 
        nv = v.size
      else
        nv = @nVisibleTreasures  
      end
    
      if @nHiddenTreasures > h.size
        nh = h.size                    
      else
        nh = @nHiddenTreasures
      end
    
      bc = NumericBadConsequence.new(@text,0,nv,nh)
    
      return bc
    end  

    def to_s
      "Name: #{@text},Niveles perdidos: #{@levels},Tesoros visibles perdidos: #{@nVisibleTreasures},Tesoros ocultos perdidos: #{@nHiddenTreasures},Muerto: #{@death}"
    end
  
  end
end