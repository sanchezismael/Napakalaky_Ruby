# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
class Napakalaki
  include Singleton
  
  attr_reader :currentPlayer, :currentMonster

  def initialize()
    @currentPlayer = nil
    @players = Array.new
    @dealer = nil
    @currentMonster = nil
  end
  
  private
  def initPlayer(names)
    names.each { |i| players << Player.new(i) }
  end
  
  def nextPlayer()
    if @currentPlayer == nil
      jugador = rand(@players.size)
    else
      if @players.size == @players.index(@currentPlayer)
        jugador = 0
      else
        jugador = @players.index(@currentPlayer) + 1
      end
    end
    return jugador
  end
  
  def nextTurnAllowed()
    if @currentPlayer == nil
      permitido = true
    else
      permitido = @currentPlayer.validState()
    end
    
    return permitido
  end
  
  def setEnemies()
    
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
    result == (CombatResult::WINGAME)
  end
  
end
