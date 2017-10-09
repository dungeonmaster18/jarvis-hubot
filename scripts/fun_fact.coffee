# Description:
#   A Hubot that keeps your team relaxed by telling you a fun fact whenever you ask.
#
# Dependencies:
#   None
#
# Author:
#   github.com/dungeonmaster18


# List of insipirational quotes
funfacts = ['McDonalds calls frequent buyers of their food “heavy users.',
						'The average person spends 6 months of their lifetime waiting on a red light to turn green.',
						'The largest recorded snowflake was in Keogh, MT during year 1887, and was 15 inches wide.',
						'The expiration date on water bottles is for the bottle, not the water.',
						'Bird poop is white because they don’t pee.',
						'First law of cartoon physics: gravity doesn’t work until you look down.',
						'You can always see your nose, but your mind just ignores it.',
						'The year 2015 will be one second longer than usual because of the slowing of the Earth’s rotation.',
						'Google has been acquiring 2 companies per month since 2010.',
						'Blue flames are hotter than red flames.',
						'On Venus, it snows metal. Two types have been discovered so far: galena and bismuthinite.'
						]

# Some variables
bool = [0, 1]

module.exports = (robot) ->

	robot.hear /fun facts/i, (res) ->
		res.reply res.random funfacts

	robot.respond /fun/i, (res) ->
		res.send res.random funfacts

	robot.respond /facts/i, (res) ->
		res.send res.random funfacts

	robot.hear /repeat (.*)/i, (res) ->
		rand = res.random bool
		if rand is 0
			res.reply "That is outrageous!"
		else
			res.send "#{res.match[1]}"

	# Log errors
	robot.error (err, res) ->
		robot.logger.error err
		robot.logger.error "Exterminate!"

		if res?
			res.reply "That didn't work right"