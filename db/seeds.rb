# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
plan1 = Plan.create( { title: 'plan1' } )
plan2 = Plan.create( { title: 'plan2' } )
plan1.spots = Spot.create( [ { name: 'spot1' }, { name: 'spot2' }, { name: 'spot3' } ] )
plan2.spots = Spot.create( [ { name: 'spot4' }, { name: 'spot5' } ] )

#candidate = Candidate.create( { name: 'cand1' } )
#candidate.spots = Spot.build( [ { name: 'spot1' }, { name: 'spot2' }, { name: 'spot3' } ] )
#spot = Spot.create( [ { name: 'spot4' } ] )
#plan.spots = [Spot.last]

