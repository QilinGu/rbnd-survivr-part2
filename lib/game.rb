class Game
	attr_reader :tribes

	def initialize(tribe1, tribe2)
		@tribes = [tribe1, tribe2]
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		@tribes.sample
	end

	def clear_tribes
		@tribes.clear
	end

	def merge(name)
		merged_members = @tribes[0].members + @tribes[1].members
		clear_tribes
		add_tribe(Tribe.new(name: name, members: merged_members))
		return @tribes[0]
	end

	def individual_immunity_challenge
		@tribes.sample.members.sample
	end
end