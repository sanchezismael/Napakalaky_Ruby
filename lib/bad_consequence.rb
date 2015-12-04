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
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures,Array.new,Array.new,
      false)      
    end
    
    def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,
      someSpecificHiddenTreasures)
      new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,
      false)
    end
    
    def self.newDeath(aText, death)
      new(aText,0,0,0,Array.new,Array.new,death)
    end
    
    def isEmpty()
      if(@levels == 0 && @nVisibleTreasures ==0 && @nHiddenTreasures == 0 && !@death)
        if(@specificHiddenTreasures.size == 0 && @specificVisibleTreasures.size == 0)
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
    
    def adjustToFitTreasureLists(v, h)
            tesoros_visibles = Array.new
            tesoros_ocultos = Array.new
            nv = 0
            nh = 0
            bc = BadConsequence.newLevelNumberOfTreasures("",0,0,0)

            if @nHiddenTreasures > 0 or @nVisibleTreasures > 0
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

                bc = BadConsequence.newLevelNumberOfTreasures(@text,0,nv,nh)
            else
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
                v.each do |treasure|	
                  if treasure.type == specificHiddenTreasure
                    esta = true
                end
                  if(esta)
                    tesoros_ocultos << specificHiddenTreasure
                  end             
                
                end  
              end
              bc = BadConsequence.newLevelSpecificTreasures(@text,0,tesoros_visibles, tesoros_ocultos)
            return bc

        end
    end
    
    def self.getmaxtreasures
      @@MAXTREASURES
    end
    
   
    
    def to_s
      "Name: #{@text},Niveles perdidos: #{@levels},Tesoros visibles perdidos: #{@nVisibleTreasures},Tesoros ocultos perdidos: #{@nHiddenTreasures},Muerto: #{@death}, Tesoros especificos visibles: #{@specificVisibleTreasures},Tesoros especificos ocultos: #{@specificHiddenTreasures}"
      
      #private :new 
    end
    
#    un_bad = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
#    puts un_bad.to_s
#    
#    puts "Un_Bad: #{un_bad.specificVisibleTreasures}"
#    puts "Un_Bad: #{un_bad.specificHiddenTreasures}"
end
end
