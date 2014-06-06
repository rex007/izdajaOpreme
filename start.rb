require 'date'
require_relative 'oprema.rb'

def izdaja_opreme(evidenca)
	id = 1
	(evidenca.size).times { id +=1}
	print "oprema: "
	oprema = gets.chomp
	print "Ime in Priimek prejemnika: "
	prejemnik = gets.chomp.capitalize
	print "Rok vracila: "
	rok = gets.chomp.to_i
	vrniti = izracun_datuma_vrnitve(rok).strftime("%d %m, %Y")
	evidenca << Oprema.new(id,oprema,prejemnik,vrniti,status="izdana")
end
def vracilo_opreme(evidenca)
	evidenca.each{|e| e.izdana_oprema }
	print "Izberi opremo, katera je bila vrnjena: "
	id = gets.chomp.to_i
	evidenca.each do |e|
		e.status = "vrnjena" if e.ustrezen(id)
	end
end

def izracun_datuma_vrnitve(rok)
	datum = Date.today
	vrniti = datum + rok
end


evidenca = []


while true
	puts "\t(1)Izdaja opreme,\n\t(2)Vracilo opreme,\n\t(3)Pregled izdane opreme,\n\t(4)Zamujena,\n\t(5)Izhod"
	print "Izbor: "
	input = gets.chomp.to_i
	case input
	when 1; izdaja_opreme(nova_evidenca)
	when 2; vracilo_opreme(evidenca)
	when 3; evidenca.each {|e| puts e}
	when 4; evidenca.each {|e| e.izdana_oprema if e.zamuda}
	when 5;break
	end
end


