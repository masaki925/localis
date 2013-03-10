# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
plan = Plan.create( { title: 'plan1' } )
candidate = Candidate.create( { name: 'cand1' } )
spot = Spot.create( [ { name: 'spot1', position: 1 }, { name: 'spot2', position: 2 }, { name: 'spot3', position: 3 } ] )
candidate.spots = Spot.all
spot = Spot.create( [ { name: 'spot4', position: 4 } ] )
plan.spots = [Spot.last]

