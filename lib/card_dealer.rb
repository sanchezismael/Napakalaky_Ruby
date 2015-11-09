# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki

require 'singleton'
class CardDealer
  
  include singleton
  
  def initialize
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
    @usedMonsters = Array.new
    @unusedMonsters = Array.new
  end
  
  def initTreasureCardDeck()
    @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, [TreasureKind::HELMET])
    @unusedTreasures << Treasure.new("Botas de investigación", 3, [TreasureKind::SHOES])
    @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, [TreasureKind::HELMET])
    @unusedTreasures << Treasure.new("A prueba de babas", 2, [TreasureKind::ARMOR])
    @unusedTreasures << Treasure.new("Botas de lluvia ácida", 2, [TreasureKind::ARMOR])
    @unusedTreasures << Treasure.new("Casco minero",2 , [TreasureKind::HELMET])
    @unusedTreasures << Treasure.new("Ametralladora Thomson", 4, [TreasureKind::BOTHHANDS])
    @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, [TreasureKind::ARMOR])
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Fed alópodo", 3, [TreasureKind::HELMET])
    @unusedTreasures << Treasure.new("Hacha prehistórica", 2, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, [TreasureKind::ARMOR])
    @unusedTreasures << Treasure.new("Gaita", 4, [TreasureKind::BOTHHANDS])
    @unusedTreasures << Treasure.new("Insecticida", 2, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, [TreasureKind::BOTHHANDS])
    @unusedTreasures << Treasure.new("Garabato místico", 2, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("La rebeca metálica", 2, [TreasureKind::ARMOR])
    @unusedTreasures << Treasure.new("Lanzallamas", 4, [TreasureKind::BOTHHANDS])
    @unusedTreasures << Treasure.new("Necrocomicón", 1, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Necronomicón", 5, [TreasureKind::BOTHHANDS])
    @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, [TreasureKind::BOTHHANDS])
    @unusedTreasures << Treasure.new("Necrognomicón", 2, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Necrotelecom", 2, [TreasureKind::HELMET])
    @unusedTreasures << Treasure.new("Mazo d elos antiguos", 3, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Necroplayboycón", 3, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Porra preternatural", 2, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Shogulador",1 , [TreasureKind::BOTHHAND])
    @unusedTreasures << Treasure.new("Varita de atizamiento", 3, [TreasureKind::ONEHAND])
    @unusedTreasures << Treasure.new("Tentáculo de pega",2 , [TreasureKind::HELMET])
    @unusedTreasures << Treasure.new("Zapato deja-amigos",1 , [TreasureKind::SHOES])
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
