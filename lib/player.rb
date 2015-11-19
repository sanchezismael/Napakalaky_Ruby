# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
  attr_writer :pendingBadConsequence, :enemy
  
  
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
  
  def haveStolen()
    @canSteal = false
  end
  
  def bringToLife()
    @dead = false;
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
    
  end
  
  def applyBadConsequence(m)
    
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
#  def isDead()
#    @dead
#  end
  
  def combat(m)
    
  end
  
  def makeTreasureVisible(t)
    
  end
  
  def discardVisibleTreasure(t)
    
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
    
  end
  
  def stealTreasure()
    
  end
  

  
#  def canISteal()
#    @canSteal
#  end
  
  
  
  
  
  def discardAllTreasures()
    
  end
  
  
end
