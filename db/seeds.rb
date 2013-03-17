# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do |i|
  Request.create( { title: "request#{i+1}" } )
end

2.times do |i|
  Plan.create( { title: "plan#{i+1}" } )
end

3.times do |i|
  spot = Spot.create( { name: "spot#{i+1}" } )
end

spots1 = [Spot.find(1), Spot.find(2)]
spots2 = [Spot.find(2), Spot.find(3)]


# for request 1
2.times do |i|
  request = Request.find(1)

  candidate = Candidate.create( { name: "cand#{i+1}" } )
  candidate.spot_id    = spots1[i].id
  candidate.request_id = request.id
  candidate.save
end


# for request 2
2.times do |i|
  request = Request.find(2)

  # cand のname は最終的に無くなる
  candidate = Candidate.create( { name: "cand#{i+3}" } )
  candidate.spot_id    = spots2[i].id
  candidate.request_id = request.id
  candidate.save
end


Plan.first.spots = [Spot.first]

