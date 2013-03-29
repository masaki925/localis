# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do |i|
  r = Request.new( { 
                    username: "user1",
                    title: "title1",
                    start_datetime: Time.now,
                    end_datetime: Time.now,
                    people_num: 0,
                    budget_hotel: 0.0,
                    budget_meal: 0.0,
                    deadline_datetime: Time.now
  } )
  r.user_id = i+1
  r.save
  User.create( { email: "user#{i+1}@example.com" } )
end

3.times do |i|
  Spot.create( { name: "spot#{i+1}", google_reference: "CoQBewAAACP8ZAvXwJ0Rw9Mav9Tewjlx2OYQ_XEry6C7tU0uAK2JU64X-nvwMAsbesGpDejiT0cMMy1RZGndCqvnQruOBDRUpl1UQSgT7fsr1VeelqpDBA6-tEkdpPQLqrUJs4PfRlxE4YoF28B-Su6Y7Mpu02mgxZHfjeMIn6t_cC_-TBPTEhCHIaISQ40ifTaQ3VdU40DyGhQ0_NFQeJfNwb9OEQgQtUlp-lPZkQ" } )
end

spots1 = [Spot.find(1), Spot.find(2)]
spots2 = [Spot.find(2), Spot.find(3)]

# for request 1 ----------------------------
request1 = Request.find(1)
candidate = Candidate.new
candidate.spots = spots1
candidate.request_id = request1.id
candidate.user = User.first
candidate.save

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
candidate = Candidate.new
candidate.spots = spots2
candidate.request_id = request2.id
candidate.user = User.first
candidate.save

plan2 = Plan.create( { title: "plan2" } )
plan2.request = request2
plan2.save

2.times do |i|
  plan_day = PlanDay.create( { day: i+1 } )
  plan_day.plan = plan2
  plan_day.save
end


PlanDay.first.spots = [Spot.first]

