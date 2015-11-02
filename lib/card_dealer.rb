# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CardDealer
  
  include singleton
  attr_reader :Napakalaki.instance
  
  def initialize
    @unusedTreasures
    @usedTreasures
    @usedMonsters
    @unusedMonsters
  end
  
  def initTreasureCardDeck()
    
  end
  
  def initMonsterCardDeck()
    
  end
  
  def shuffleTreasures()
    
  end
  
  def ShuffleMonsters()
    
  end
  
  def nextTreasure()
    
  end
  
  def nextMonster()
    
  end
  
  def giveTreasureBack(t)
    
  end
  
  def giveMonsterBack(m)
    
  end
  
  def initCards()
    
  end
  
  private :initTreasureCardDeck, :initMonsterCardDeck, :shuffleTreasures, :shuffleMonsters
  
end
