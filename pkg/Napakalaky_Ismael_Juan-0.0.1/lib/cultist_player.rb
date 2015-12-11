# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
  class CultistPlayer<Player
    @@totalCultistPlayers = 0
    def initialize(p,c)
      super(p.name)
      copia(p)
      @myCultistCard = c
      @@totalCultisPlayer += 1
    end
   protected

    def getCombatLevel
      lvl = super
      lvl = lvl*1.2
      lvl += @myCultistCard.gainedLevels
      lvl = lvl*@@totalCultistPlayers
      lvl
    end

    def getOponentLevel(m)
      return m.getCombatLevelAgainsCultistPlayer
    end

    def shouldConvert
      false
    end
  private

    def giveMeAtreasure
      i = rand(@visibleTreasures.size)
      return @visibleTreasures.at(i)
    end

    def canYouGiveMeATreasure
      if(@enemy.visibleTreasures.empty?)
        false
      else
        true
      end
    end
  public  

    def getTotalCultisPlayers

    end 

  end
end