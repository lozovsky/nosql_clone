#!/usr/bin/ruby

require 'mongo'
require 'builder'
require 'optparse'
require_relative '../lib/connection'

options = {}
optparse = OptionParser.new do |opt|
  opt.on('-d', '--district symbol') { |o| options[:district] = o }
end

begin
  optparse.parse!
rescue OptionParser::MissingArgument
  puts "\nUse -d <symbol> to select a district statistc.\n"
end

if options[:district]
    areaid=options[:district]
else
  areaid="12"
end

conn = Connection.new
db = conn.client.database
alarms = conn.alarms

results = alarms.aggregate([
    {"$match" => { "Area ID": areaid}},
    {'$group' => { '_id' => "$Victim Age", 'count' => { '$sum' => 1}}},
    {'$sort' => {count: -1}},
    ])


puts results.to_a
