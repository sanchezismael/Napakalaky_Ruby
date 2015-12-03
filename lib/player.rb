# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'card_dealer.rb'
require_relative 'dice.rb'
module Napakalaki
class Player
  
  @@MAXLEVEL = 10
 
  def initialize(name)
    @name = name
    @level = 1
    @dead = true
    @canISteal = true
    @enemy = nil
    @hiddenTreasures = Array.new
    @visibleTreasures = Array.new
    @pendingBadConsequence = nil   
  end
  
  attr_reader :name, :level, :hiddenTreasures, :visibleTreasures, :dead, :canISteal
  attr_writer :pendingBadConsequence
  attr_accessor :enemy
  
  
  private
  
  def giveMeATreasure()
    #    return @hiddenTreasures.sample Ruby 2.0 -> Estamos usando 1.7.3
    i = rand(@hiddenTreasures.size)
    return @hiddenTreasures.at(i)
  end
  
  def canYouGiveMeATreasure()   #Los tesoros que se roban son tesoros ocultos
    if(@hiddenTreasures.empty?) #por tanto, compruebo que tiene tesoros ocultos
      false
    else
      true
    end
  end
  
  def haveStolen
    @canSteal = false
  end
  
  def bringToLife
    @dead = false
  end
  
  def getCombatLevel()
    suma = 0
    @visibleTreasures.each do |i|
      suma = suma+i.bonus
    end
    @level+suma
  end
  
  def incrementLevels(l)
    @level = @leve+l
    if(@level > MAXLEVEL)
      @level = MAXLEVEL
    end
  end
  
  def decrementLevels(l)
    @level = @level-l
    if(@level < 1)
      @level = 1
    end
  end
  
  def applyPrize(m)
    nLevels = m.getLevelsGained
    self.incrementLevels(nLevels)
    nTreasures = m.getTreasuresGained
    
    if nTreasures > 0
      dealer = CardDealer.instance
      for i in 1..nTreasures
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end
    
  end
  
  def applyBadConsequence(m)
    badConsequence = m.badConsequence
    nLevels = badConsequence.levels
    self.decrementLevels(nLevels)
    pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    self.setPendingBadConsequence(pendingBad)
  end
  
  def canMakeTreasureVisible(t)
    puedo = false
    
    unamano = 0
    dosmanos = 0
    armadura = 0
    casco = 0
    zapatos = 0
    
    @visibleTreasures.each do |i|
      if i.type == TreasureKind::ONEHAND
        unamano += 1
      elsif i.type == TreasureKind::BOTHHANDS
        dosmanos += 1
      elsif i.type == TreasureKind::ARMOR
        armadura += 1
      elsif i.type == TreasureKind::HELMET
        casco += 1
      elsif i.type == TreasureKind::SHOES
        zapatos += 1
      end
    
      if (t.type == TreasureKind::ONEHAND && unamano < 2 && dosmanos == 0)
        puedo = true
      elsif (t.type == TreasureKind::BOTHHANDS && unamano == 0 && dosmanos == 0)
        puedo = true
      elsif (t.type == TreasureKind::ARMOR && armadura == 0)
        puedo = true
      elsif (t.type == TreasureKind::HELMET && casco == 0)
        puedo = true
      elsif (t.type == TreasureKind::SHOES && zapatos == 0)
        puedo = true
      end
    
      return puedo
    end
  end
  
  def howManyVisibleTreasures(tkind)
    @visibleTreasures.each do |i|
      n = 0
      if(tkind == i)
        n += 1
      end
    end
    n
  end
  
  def dielfNoTreasures()
    if(@hiddenTreasures.empty? && @visibleTreasures.empty?)
      @dead = true;
    end
  end
  
  public

  def combat(m)
    myLevel = getCombatLevel
    monsterLevel = m.getCombatLevel
    if(myLevel > monsterLevel)
      applyPrize(m)
      if(this.level >= MAXLEVEL)
        combatResult = [CombatResult::WINGAME]
      else
        combatResult = [CombatResult::WIN]
      end
    else
      applyBadConsequence(m)
      combatResult = [CombatResult::LOSE]
    end
    return combatResult
  end
  
  def makeTreasureVisible(t)
    canI = canMakeTreasureVisible(t)
    if(canI)
      @visibleTreasures << t
      @hiddenTreasures.remove(t)
    end
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.remove_instance_variable(t)
    if(@pendingBadConsequence != nil && (!pendingBadConsequence.isEmpty))
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    dielfNoTreasures
  end
  
  def discardHiddenTreasure(t)
    
  end
  
  def validState()
    if(@pendingBadConsequence.isEmpty && @hiddenTreasures.size <=4 )
      true
    else
      false
    end    
  end
  
  def initTreasures()
    dealer = CardDealer.instance
    dice = Dice.instance 
    bringToLife
    treasure = dealer.nextTreasure
    @hiddenTreasures << treasure
    number = dice.nextNumber
    
    if number>1
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
    end
    
    if number == 6
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
    end
 
  end
  
  def stealTreasure()
    canI = self.canISteal
    if canI 
      canYou = @enemy.canYouGiveMeATreasure
      if canYou
        treasure = @enemy.giveMeATreasure
        @hiddenTreasures << treasure
        self.haveStolen
        return treasure
      end
    end
    return nil
  end
    
  def discardAllTreasures()
    cvisibleTreasures = Array.new(@visibleTreasures)
    cvisibleTreasures.each do |vtreasure|
      self.discardVisibleTreasure(vtreasure)
    end
    chiddenTreasures = Array.new(@hiddenTreasures)
    chiddenTreasures.each do |htreasure|
      self.discardHiddenTreasure(htreasure)
    end
  end
  
  def to_s
      "Name: #{@name}
       Level: #{@level}
       Dead: #{@dead}
       CanISteal: #{@canISteal}"
#       Enemy: #{@enemy}
      "Visible Treasures: #{@visibleTreasures}
       Hidden Treasures: #{@hiddenTreasures}"
    
#       if (@pendingBadConsequence != nil)
#         "pendingBadConsequence: #{@pendingBadConsequence}"
#       end
  end
  
end
end