# Description:
#   A Hubot that keeps your team motivated by telling you an inspirational quote whenever you ask.
#   Think of it as your butler with fewer abilities
#
# Dependencies:
#   None
#
# Configuration:
#   No additional configuration required
#   (You might need to set HUBOT_SLACK_TOKEN and HUBOT_HEROKU_KEEPALIVE_URL depending on how you deploy Hubot)
#
# Commands:
#   hubot inspire me - replies with an insipirational quote
#   hubot i need inspiration - replies with an inspirational quote
#   why do we fall - replies with "So that we can learn to pick ourselves up"
#   repeat <say something> - will either repeat that or surprise you!
#
# Author:
#   github.com/AparaV


# List of insipirational quotes
inspirationalquotes = ['Why do we fall? So that we can learn to pick ourselves up.',
						'The lion does not concern itself with the opinions of the sheep.',
						'Do or do not. There is no try.',
						'Training is nothing. Will is everything.',
						'All we have to decide is what to do with the time that is given to us.',
						'He that breaks a thing to find out what it is has left the path of wisdom.',
						'You cannot pass! I am a servant of the Secret Fire, wielder of the flame of Anor. You cannot pass. The dark fire will not avail you, flame of Udun. Go back to the Shadow! You cannot pass.',
						'Even the wise cannot see all ends.',
						'It is our choices, that show what we truly are, far more than our abilities',
						'The only thing standing between you and your goal is the bullshit story you keep telling yourself as to why you can\'t achieve it.',
						'I\'m seriously running out of things to say to you people...'
						]

# Some variables
bool = [0, 1]

module.exports = (robot) ->

	robot.hear /why do we fall/i, (res) ->
		res.reply "So that we can learn to pick ourselves up."

	robot.respond /inspire/i, (res) ->
		res.send res.random inspirationalquotes

	robot.respond /inspiration/i, (res) ->
		res.send res.random inspirationalquotes

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