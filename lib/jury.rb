class Jury
  attr_accessor :members
  def initialize
  	@members = []
  end
  def add_member(member)
  	@members << member
  end
  def members
  	@members
  end
  def cast_votes(finalists)
  	votes = {}
  	finalists.each do |finalist|
  		votes[finalist] = 0
  	end
  	@members.each do |member|
  	  vote = finalists.sample
  	  puts "#{member.to_s.capitalize.blue} votes for #{vote.to_s.capitalize.pink}"
  	  votes[vote] += 1
  	end
  	votes
  end
  def report_votes(votes)
  	votes.each do |finalist, vote|
  		puts "#{finalist.to_s.capitalize}: #{vote.to_s.yellow}"
  	end
  end
  def announce_winner(votes)
  	votes.each do |finalist, vote|
  		if vote >= 4
  			puts "The winner is #{finalist.name.capitalize.pink}!"
  			return finalist
  		end
  	end
  end
end