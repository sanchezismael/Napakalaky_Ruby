# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
class Napakalaki
  include Singleton
  
  attr_reader :currentPlayer, :currentMonster
  attr_writer :enemies
  def initialize()
    @currentPlayer = nil
    @players = nil
    @dealer = nil
    @currentMonster = nil
  end
  
  private
  def initPlayer(names)
    
  end
  
  def nextPlayer()
    
  end
  
  def nextTurnAllowed()
    
  end
  
  public
  
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
  
  def nextTurn()
    
  end
  
  def endOfGame(result)
    
  end
  
end
