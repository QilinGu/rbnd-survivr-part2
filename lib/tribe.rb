class Tribe
	attr_reader :name, :members
	def initialize(options={})
		@name = options[:name]
		@members = options[:members]
		puts "Tribe #{@name.pink} successfully created!"
	end
	def to_s
		@name
	end
	def tribal_council(options={})
		eliminated = @members.reject {|member| member == options[:immune]}.sample
		@members.delete(eliminated)
		return eliminated
	end
end