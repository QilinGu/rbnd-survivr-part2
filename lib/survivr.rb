require 'colorizr'

require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	puts "Phase One: Pre-Merge".yellow
	8.times do
		lost_tribe = @borneo.immunity_challenge
		puts "Tribe #{lost_tribe.to_s.red} has lost this round. They are voting off a member."
		eliminated_contestant = lost_tribe.tribal_council
		puts "#{eliminated_contestant.to_s.capitalize.red} was voted off."
	end
	#puts "Phase one ends. 8 contestants were voted off in this phase, and 12 contestants remain in the game."
end

def phase_two
	puts "Phase Two: Merge".yellow
	3.times do
		immune = @borneo.individual_immunity_challenge
		puts "#{immune.to_s.capitalize.green} wins immunity for this round!"
		eliminated_contestant = @merge_tribe.tribal_council(immnue: immune)
		puts "#{eliminated_contestant.to_s.capitalize.red} was voted off."
	end
	#puts "Phase two ends. 3 contestants were voted off in this phase, and 9 contestants remain in the game."
end

def phase_three
	puts "Phase Three: Jury Phase".yellow
	7.times do
		immune = @borneo.individual_immunity_challenge
		puts "#{immune.to_s.capitalize.green} wins immunity for this round!"
		eliminated_contestant = @merge_tribe.tribal_council(immnue: immune)
		@jury.add_member(eliminated_contestant)
		puts "#{eliminated_contestant.to_s.capitalize.red} was voted off and become a jury member."
	end
	#puts "Phase three ends. 7 contestants were voted off in this phase and became jury members. 2 finalists remain in the game."
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
