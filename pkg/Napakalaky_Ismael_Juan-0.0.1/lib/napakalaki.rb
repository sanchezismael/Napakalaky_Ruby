# encoding: utf-8

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require 'card_dealer.rb'
require 'player.rb'
module Napakalaki
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
  def initPlayers(names)
    names.each do |i| 
      @players << Player.new(i)
    end
  end
  
  def nextPlayer()
    if @currentPlayer == nil
      indice = rand(@players.size)
    else
      if (@players.size-1) == @players.index(@currentPlayer)
        indice = 0
      else
        indice = @players.index(@currentPlayer) + 1
      end
    end
    return @players.at(indice)
  end
  
  def nextTurnIsAllowed()
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
      @players.at(i).enemy = @players.at(index)
      i+=1
    end
  end
  
  public
  
  def developCombat
    combatResult = @currentPlayer.combat(@currentMonster)
    if combatResult == CombatResult::LOSEANDCONVERT
      cartaCultist = @dealer.nextCultist
      cultisPlayer = CultistPlayer.new(@currenPlayer, cartaCultist)
      @Players.each do |player|
        if(player.ene == @currentPlayer)
          player.ene = cultistPlayer
        end
      end
      @Players.delete(@currentPlayer)
      @Players << cultistPlayer
      @currentPlayer = cultistPlayer
    end 
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
    stateOK = nextTurnIsAllowed
    if(stateOK)
      @currentMonster = @dealer.nextMonster
      @currentPlayer = nextPlayer
      muerto = @currentPlayer.dead
      if(muerto)
        @currentPlayer.initTreasures
      end
    end
    return stateOK
  end
  
  def endOfGame(result)
    result == (CombatResult::WINGAME)
  end
  
end
end