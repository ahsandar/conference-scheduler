require 'bundler/setup'
require 'json'
require 'time'
require_relative 'lib/day.rb'
require_relative 'lib/session.rb'
require_relative 'lib/talk.rb'
require_relative 'lib/conference.rb'
require_relative 'lib/track.rb'
require_relative 'lib/patches.rb'
require_relative 'lib/constants.rb'
require_relative 'lib/helper.rb'
require_relative 'lib/schedule.rb'
require_relative 'lib/sorter.rb'
require_relative 'lib/app.rb'

app = App.new('talks.json')
app.run
app.conf_schedule
