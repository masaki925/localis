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

3.times do |i|
  spot = Spot.create( { name: "spot#{i+1}" } )
end

spots1 = [Spot.find(1), Spot.find(2)]
spots2 = [Spot.find(2), Spot.find(3)]


# for request 1 ----------------------------
request1 = Request.find(1)

2.times do |i|
  candidate = Candidate.create( { name: "cand#{i+1}" } )
  candidate.spot_id    = spots1[i].id
  candidate.request_id = request1.id
  candidate.save
end

plan1 = Plan.create( { title: "plan1" } )
plan1.request = request1
plan1.save

2.times do |i|
  plan_day = PlanDay.create( { day: i+1 } )
  plan_day.plan = plan1
  plan_day.save
end



# for request 2 ----------------------------
request2 = Request.find(2)

2.times do |i|
  # cand のname は最終的に無くなる
  candidate = Candidate.create( { name: "cand#{i+3}" } )
  candidate.spot_id    = spots2[i].id
  candidate.request_id = request2.id
  candidate.save
end

plan2 = Plan.create( { title: "plan2" } )
plan2.request = request2
plan2.save

2.times do |i|
  plan_day = PlanDay.create( { day: i+1 } )
  plan_day.plan = plan2
  plan_day.save
end


PlanDay.first.spots = [Spot.first]

