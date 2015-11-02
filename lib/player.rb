# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  
  MAXLEVEL = 10
 
  def initialize(name)
    @name = name
    @level
    @dead = true;
    @canIStreal = true;
    
    #######################
    #No se donde va esto:
    #######################
    @enemy
    @hiddenTreasures
    @visibleTreasures
    @pendingBadConsequence
    #######################
    
    
  end
  
  attr_reader :name, :level

  
  def bringToLife()
   
  end
  
  def getCombatLevel()
    
  end
  
  def incrementLevels(l)
    
  end
  
  def decrementLevels(l)
    
  end
  
  def setPendingBadConsequence(b)
    
  end
  
  def applyPrize(m)
    
  end
  
  def applyBadConsequence(m)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  def howManyVisibleTreasures(tkind)
    
  end
  
  def dielfNoTreasures()
    
  end
  
  def isDead()
    
  end
  
  def getHiddenTreasures()
    
  end
  
  def getVisibleTreasures()
    
  end
  
  def combat(m)
    
  end
  
  def makeTreasureVisible(t)
    
  end
  
  def discardVisibleTreasure(t)
    
  end
  
  def discardHiddenTreasure(t)
    
  end
  
  def validState()
    
  end
  
  def initTreasures()
    
  end
  
  def getLevels()
    
  end
  
  def stealTreasure()
    
  end
  
  def setEnemy(enemy)
    
  end
  
  def giveMeATreasure()
    
  end
  
  def canISteal()
    
  end
  
  def canYouGiveMeATreasure()
    
  end
  
  def haveStolen()
    
  end
  
  def discardAllTreasures()
    
  end
  
  private :bringToLife, :getCombatLevel, :incrementLevels, :decrementLevels, :setPendingBadConsequence, :applyPrize, :applyBadConsequence,
          :canMakeTreasureVisible, :howManyVisibleTreasures, :dielfNoTreasures, :giveMeATreasure, :canYouGiveMeATreasure, :haveStolen
  
  
end
