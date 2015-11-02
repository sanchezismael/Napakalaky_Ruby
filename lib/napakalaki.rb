# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Napakalaki
  include singleton
  
  attr_reader :Napakalaki.instance, :CurrentPlayer, :CurrentMonster
  attr_writer :Enemies
  def initialize()
    @currentPlayer
    @players
    @dealer
    @currentMonster
  end
  
  private
  def initPlayer(names)
    
  end
  
  def nextPlayer()
    
  end
  
  def nextTurnAllowed()
    
  end
  
  def developCombat()
    
  end
  
  def discardVisibleTreasures(treasures)
    
  end
  
  def discardHiddenTreasures(treasures)
    
  end
  
  def makeTreasuresVisible(treasures)
    
  end
  
  def initGame(players)
    
  end
  
  def nectTurn()
    
  end
  
  def endOfGame(result)
    
  end
  
end
