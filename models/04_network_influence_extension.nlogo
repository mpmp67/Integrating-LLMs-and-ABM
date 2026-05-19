globals [
  adoption-rate
  average-consumption
]

turtles-own [
  agent-type
  attitude
  resistance
  social-susceptibility
  conserving?
  consumption
  adoption-probability
]

to setup
  clear-all
  set-default-shape turtles "person"

  create-turtles population [
    setxy random-xcor random-ycor
    assign-agent-type
    assign-agent-profile

    ifelse random-float 1 < initial-conservation-rate
    [ set conserving? true ]
    [ set conserving? false ]

    set adoption-probability 0
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

to assign-agent-type
  let r random-float 1

  if r < committed-share [
    set agent-type "committed"
  ]
  if r >= committed-share and r < (committed-share + social-share) [
    set agent-type "social"
  ]
  if r >= (committed-share + social-share) [
    set agent-type "resistant"
  ]
end

to assign-agent-profile
  if agent-type = "committed" [
    set attitude bounded-random-normal 0.8 0.1
    set resistance bounded-random-normal 0.2 0.1
    set social-susceptibility bounded-random-normal 0.5 0.15
  ]

  if agent-type = "social" [
    set attitude bounded-random-normal 0.5 0.15
    set resistance bounded-random-normal 0.4 0.15
    set social-susceptibility bounded-random-normal 0.8 0.1
  ]

  if agent-type = "resistant" [
    set attitude bounded-random-normal 0.2 0.1
    set resistance bounded-random-normal 0.8 0.1
    set social-susceptibility bounded-random-normal 0.3 0.15
  ]
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

  let decision-tendency
      (beta-policy * policy-strength) +
      (beta-attitude * attitude) +
      (beta-social * social-influence * social-susceptibility) -
      (beta-resistance * resistance)

  set adoption-probability 1 / (1 + exp (- decision-tendency))

  ifelse conserving? [
    let dropout-probability (1 - adoption-probability) * relapse-factor
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
  if conserving? [
    if agent-type = "committed" [ set color green ]
    if agent-type = "social" [ set color lime ]
    if agent-type = "resistant" [ set color turquoise ]
  ]
  if not conserving? [
    if agent-type = "committed" [ set color red ]
    if agent-type = "social" [ set color orange ]
    if agent-type = "resistant" [ set color brown ]
  ]
end

to update-global-metrics
  set adoption-rate count turtles with [conserving?] / count turtles
  set average-consumption mean [consumption] of turtles
end

to-report bounded-random-normal [mu sigma]
  let x random-normal mu sigma
  report max list 0 min list 1 x
end
