class Oprema
	attr_accessor :status, :vrniti
	def initialize(id,naziv,prejemnik,vrniti,status)
		@id = id
		@naziv = naziv
		@prejemnik = prejemnik
		@vrniti = vrniti
		@status = status
	end

	def izdana_oprema
		print "\t\t#{@id} #{@naziv}, izposodil: #{@prejemnik}, status: #{@status}, vrniti do #{@vrniti}" if @status.include?("izdana")
		puts " "
	end

	def ustrezen(input)
		ok = false
		ok = true if @id == input
	end

	def zamuda
		ok = false
		ok = true if @vrniti <= Date.today.strftime("%d %m, %Y")
	end

end