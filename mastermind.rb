Dir["./lib/*.rb"].each { |file| require file }

Board.new.start
