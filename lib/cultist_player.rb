# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
  class CultistPlayer<Player
    @@totalCultisPlayers = 0
    def initialize(p,c)
      super(p.name)
      copia(p)
      @myCultistCard = c
      @@totalCultisPlayer += 1
    end
   protected

    def getCombatLevel
      lvl = super
      lvl += @myCultistCard.getSpecialValue
      lvl
    end

    def getOponentLevel(m)

    end

    def shouldConvert

    end
  private

    def giveMeAtreasure

    end

    def canYouGiveMeATreasure

    end
  public  

    def getTotalCultisPlayers

    end 

  end
end