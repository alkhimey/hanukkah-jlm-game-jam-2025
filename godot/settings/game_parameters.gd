extends Node

# poisson_rate average number of arrivals per second. Lower is faster.
const client_arrival_rate = 2.0
 
# Points per second per client in queue
const lose_rate_increase = 0.001 # 1 

# Automatic decrease over time (points per second_
const win_rate_decrease = 0.5

# Increase per user action
const win_increase = 20# 1

const max_clients_in_queue = 10



### Visual

# How fast an excuse fades out when presented.
# units per second. 1 is opace, 0 is transparent.
const excuse_fade_out_rate = 0.4
