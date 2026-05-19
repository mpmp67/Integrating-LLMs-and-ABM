globals [
  adoption-rate
  average-consumption
]

turtles-own [
  attitude
  resistance
  social-susceptibility
  conserving?
  consumption
]

to setup
  clear-all
  set-default-shape turtles "person"

  create-turtles population [
    setxy random-xcor random-ycor
    set attitude random-float 1
    set resistance random-float 1
    set social-susceptibility random-float 1

    ifelse random-float 1 < initial-conservation-rate
    [ set conserving? true ]
    [ set conserving? false ]

    update-consumption
    recolor-agent
  ]

  update-global-metrics
  reset-ticks
end

to go
  ask turtles [
    move-agent
    decide-conservation
    update-consumption
    recolor-agent
  ]

  update-global-metrics
  tick
end

to move-agent
  rt random 60 - random 60
  fd 1
end

to decide-conservation
  let nearby-conservers count turtles in-radius social-radius with [conserving?]
  let nearby-total count turtles in-radius social-radius

  let social-influence 0
  if nearby-total > 0 [
    set social-influence nearby-conservers / nearby-total
  ]

  let adoption-score
    (policy-strength * 0.4) +
    (attitude * 0.3) +
    (social-influence * social-susceptibility * 0.3) -
    (resistance * 0.4)

  let adoption-probability max list 0 min list 1 adoption-score

  ifelse conserving? [
    let dropout-probability max list 0 (0.3 - adoption-probability)
    if random-float 1 < dropout-probability [
      set conserving? false
    ]
  ] [
    if random-float 1 < adoption-probability [
      set conserving? true
    ]
  ]
end

to update-consumption
  ifelse conserving? [
    set consumption base-consumption * (1 - conservation-effect)
  ] [
    set consumption base-consumption
  ]
end

to recolor-agent
  ifelse conserving?
  [ set color green ]
  [ set color red ]
end

to update-global-metrics
  set adoption-rate (count turtles with [conserving?] / count turtles)
  set average-consumption mean [consumption] of turtles
end
