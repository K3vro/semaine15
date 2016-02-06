puts"@ECHO OFF START Leet.exe"
numeroalea = rand(1..1337)
reponse=0
total = 1
while numeroalea !=reponse
puts"ecrire un nombre entre 1 et 1337"
reponse = gets.chomp.to_i
if reponse < numeroalea
     puts"too low..."
     total += 1
  elsif reponse > numeroalea
     puts"too high..."
     total += 1
  else
     puts "GG en #{total} Try"
	 puts "GG en #{total} Try"
	 puts "GG en #{total} Try"
	 puts "GG en #{total} Try"
	 puts "GG en #{total} Try"
	 puts "GG en #{total} Try"
    end
  end
