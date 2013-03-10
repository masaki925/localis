# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
plan1 = Plan.create( { title: 'plan1' } )
plan2 = Plan.create( { title: 'plan2' } )
candidate1 = Candidate.create( { name: 'cand1' } )
candidate1.spot = Spot.create( { name: 'spot1' } )
candidate1.save
candidate2 = Candidate.create( { name: 'cand2' } )
candidate2.spot = Spot.create( { name: 'spot2' } )
candidate2.save

candidate3 = Candidate.create( { name: 'cand3' } )
spot3 = Spot.create( { name: 'spot3' } )
candidate3.spot = spot3
candidate3.save

plan1.spots = [spot3]
#plan2.spots = Spot.create( [ { name: 'spot4' }, { name: 'spot5' } ] )

#spot = Spot.create( [ { name: 'spot4' } ] )
#plan.spots = [Spot.last]

