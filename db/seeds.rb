# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
plan = Plan.create( { title: 'plan1' } )
spot = Spot.create( [ { name: 'Asakusa', position: 1 }, { name: 'Shibuya', position: 2 }, { name: 'Shinjuku', position: 3 } ] )
plan.spots = Spot.all
