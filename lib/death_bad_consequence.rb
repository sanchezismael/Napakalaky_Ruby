#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "treasure_kind.rb"
module Napakalaki

  class DeathBadConsequence < NumericBadConsequence
    
    def initialize(aText)
      super(aText,0,0,0)
      @death = true
    end
    
  end
end
