#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Napakalaki
  class Prize
    def initialize(un_treasures,un_level)
      @treasures= un_treasures
      @levels = un_level
    end
    attr_reader :treasures, :levels
    
    def to_s
      "Tesoros ganados: #{@treasures} / Niveles ganados: #{@levels}"
    end
  end


end