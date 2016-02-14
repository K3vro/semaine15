class Personne
	attr_accessor :nom, :points_de_vie, :en_vie, :degats
	
	def initialize(nom)
		@nom = nom
		@points_de_vie = 100
		@en_vie = true
	end
	
	def info	
		if @points_de_vie <=0
			@en_vie = false
			puts "#{@nom} u are did"
		else
			puts "#{@nom} #{@points_de_vie}HP"
		end
	end
	
	def attaque(personne)
		self.degats
		personne.subit_attaque(@degats)
		puts "#{self.nom} ATK #{personne.nom}"
		puts "#{personne.nom} subit #{@degats} DMG"
		puts "#{personne.info}"
	end
	
	def subit_attaque(degats_recus)
		@points_de_vie-=degats_recus
	end
end

class Joueur < Personne	
	attr_accessor :degats_bonus
	
	def initialize(nom)
		@degats_bonus = 0
		@degats = 0
		super(nom)
	end
	
	def degats
		@degats = rand(3..5)+degats_bonus
	end
	
	def soin
		@points_de_vie +=10
		if (@points_de_vie > 100)
			@points_de_vie = 100
		end
		puts "#{@nom} HEAL !"
		self.info
	end
	
	def ameliorer_degats
		@degats_bonus+=4
		puts "#{@nom} Power UP+ #{@nom} a maintenant #{@degats_bonus} DMG+"
	end
end

class Ennemi < Personne
	
	def initialize(nom)
		@degats = 0
		super(nom)
	end
	
	def degats
		@degats = rand(3..5)
	end
end

class Jeu

	def self.actions_possibles(monde)
		puts 'ACTIONS +1 :'
		puts '0 - HEAL'
		puts '1 - DMG+'
		
		i=2
		monde.ennemis.each do |ennemi|
			if ennemi.en_vie == true
				puts "#{i} - Attaquer #{ennemi.info}"
				i+=1
			end
		end
		puts '1337 - Rage Quitter'
	end
	
	def self.est_fini(joueur, monde)
		if (joueur.en_vie == false || monde.ennemis.size == 0)
			return true
		else 
			return false
		end
	end
end

class Monde
	attr_accessor :ennemis
	
	def ennemis_en_vie
		ennemis_temp=[];
		@ennemis.each do |ennemi|
			if ennemi.en_vie == true
				ennemis_temp << ennemi
			end
		end
		@ennemis = ennemis_temp
	end
end

monde = Monde.new

monde.ennemis = [
	Ennemi.new('[K3vroJESUS de type trop fort] '),
	Ennemi.new('[Phalanx de type magicarp] '),
	Ennemi.new('[Skroft de type jesus christ] ')
]

joueur = Joueur.new ("Xx-emoSaSuKe666-xX")

puts "\n\nConection fullDrive de #{joueur.nom}...\n\n"

100.times do |tour|
	puts "\n101010101010101010101010101010101 Tour #{tour} 101010101010101010101010101010101"
	Jeu.actions_possibles(monde)
	puts "\nQue ve tu fair ?"
	choix  = gets.chomp.to_i
	
	if choix == 0
		joueur.soin
	elsif choix == 1
		joueur.ameliorer_degats
	elsif choix == 1337
		break
	else
		ennemi_a_attaquer = monde.ennemis_en_vie[choix - 2]
		joueur.attaque(ennemi_a_attaquer)
	end
	
	puts "\nAttaque des ennemis..."
	monde.ennemis_en_vie
	monde.ennemis.each do |ennemi|
		ennemi.attaque(joueur)
	end
	
	puts "\nstat:"
	puts "#{joueur.info}\n"
	break if Jeu.est_fini(joueur, monde)
end
	 
puts "\nGame Over!\n"
	 
if joueur.en_vie
	puts "! GG GG GG !"
else
	puts "U LOOSE NOOB..."
end
