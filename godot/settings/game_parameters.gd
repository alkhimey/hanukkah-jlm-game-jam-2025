extends Node

### Logic

# poisson_rate average number of arrivals per second. Lower is faster.
const client_arrival_rate = 2.0
 
# Points per second per client in queue
const lose_rate_increase = 0.1

# Automatic decrease over time (points per second_
const win_rate_decrease = 0.5

# Increase per user action
const win_increase = 1

# Amount of increase of lose meter for using the decline button 
const decline_lose_increase = 3

const max_clients_in_queue = 10

# Time in seconds to wait before a clinet can be approved/declined again
const approve_cooldown = 6.0

# Time in seconds to wait before a clinet can be approved/declined again
const decline_cooldown = 2.0

### Visual

# How fast an excuse fades out when presented.
# units per second. 1 is opace, 0 is transparent.
const excuse_fade_out_rate = 0.4

# The approximate length of the work buttons. Needed to determine
# how far buttons will slide to the right when colling down.
# Determined empirically.
const cooldown_work_buttons_length = 120
