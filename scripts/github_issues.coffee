# Description:
#   Returns open issues from a Github repository
#
# Commands:
#   jarvis(hubot) issues <user/repo> - Returns open issues for the specified repository.

_  = require("underscore")

module.exports = (robot) ->
  github = require("githubot")(robot)

  # Log errors
  robot.error (err, res) ->
    robot.logger.error err
    robot.logger.error "Exterminate!"

    if res?
      res.reply "Oops, Something went wrong"

  robot.respond /issues (.*)/i, (res) ->
    github.handleErrors (response) ->
      res.reply "Oops, Something went wrong"

    repo = res.match[1].split("/")[1]

    if !repo
      repo = res.match[1].split("/")[0]
      user = process.env.HUBOT_GITHUB_USER 
    else
      user = res.match[1].split("/")[0]

    query_params = state: "open", sort: "created"
    query_params.per_page=3

    base_url = process.env.HUBOT_GITHUB_API || 'https://api.github.com'
    github.get "#{base_url}/repos/#{user}/#{repo}/issues", query_params, (issues) ->
      if !_.isEmpty issues
        for issue in issues
          labels = ("`##{label.name}`" for label in issue.labels).join(" ")
          res.reply "> [`#{issue.number}`] *#{issue.title} #{labels}* #{issue.html_url}"
        res.reply "See more <#{base_url}/repos/#{user}/#{repo}/issues/>"
      else
          res.reply "Congratulations! No open issues!"