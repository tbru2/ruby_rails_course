json.place result.overall_place
json.time format_hours result.secs
json.last_name result.last_name
json.first_name result.first_name
json.bib result.bib
json.city result.city
json.state result.state
json.gender result.gender
json.gender_place result.gender_place
json.group result.group
json.group_place result.group_place
json.swim result.swim.secs
json.pace_100 result.swim.pace_100
json.t1 result.t1
json.bike result.bike
json.mph result.bike.mph
json.t2 result.t2
json.run result.run
json.mmile format_minutes result.run.mmile
json.result_url api_races_url(result.race.id, result)
if result.racer.id
    json.racer_url api_racers_url(result.racer.id)
end