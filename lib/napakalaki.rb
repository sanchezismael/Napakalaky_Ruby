# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require 'card_dealer.rb'
require 'player.rb'

class Napakalaki
  include Singleton
  
  attr_reader :currentPlayer, :currentMonster

  def initialize()
    @currentPlayer = nil
    @players = Array.new
    @dealer = CardDealer.instance
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
    index = rand(@players.size)
    i = 0
    
    while i<@players.size
      while index == i
        index = rand(@players.size)
      end
      @players.at(i).enemy = @player.at(index)
      i+=1
    end
  end
  
  public
  
  def developCombat
    combatResult = @currentplayer.combat(@currentMonster)
    @dealer.giveMonsterBack(@currentMonster)
    return combatResult
    
  end
  
  def discardVisibleTreasures(treasures)
    treasures.each do |visibleTreasure|
      @currentPlayer.discardVisibleTreasure(visibleTreasure)
      @dealer.giveTreasureBack(visibleTreasure)
    end
  end
  
  def discardHiddenTreasures(treasures)
    treasures.each do |hiddenTreasure|
      @currentPlayer.discardHiddenTreasure(hiddenTreasure)
      @dealer.giveTreasureBack(hiddenTreasure)
    end
  end
  
  def makeTreasuresVisible(treasures)
    tresures.each do |treasure|
      @currentPlayer.makeTreasureVisible(treasure)
    end
  end
  
  def initGame(players)
    initPlayers(players)
    setEnemies
    @dealer.initCards
    nextTurn
  end
  
  def nextTurn
    stateOK = nextTurnAllowed
    if(stateOK)
      @currentMonster = @dealer.nextMonster
      @currentPlayer = nextPlayer
      dead = @currentPlayer.dead
      if(dead)
        @currentPlayer.initTreasure
      end
    end
    return stateOK
  end
  
  def endOfGame(result)
    result == (CombatResult::WINGAME)
  end
  
end
