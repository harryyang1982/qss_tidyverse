devtools::install_github("kosukeimai/qss-package",
                         build_vignettes = TRUE)

# loading dependencies
library(tidyverse)
library(qss)

### 1.3.4 Objects

result <- 5 + 3
result

print(result)
result <- 5 - 3
result

# Result <- don't dare do that.. Case sensitive

kosuke <- "professor"
kosuke

kosuke <- "professor and author"
kosuke

Result <- "5"
Result

#Result / 3
#Result * 3
#sqrt(Result)

result

class(result)

Result
class(Result)
class(sqrt)

### 1.3.5 Vectors

world_pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)
world_pop

pop_first <- c(2525779, 3026003, 3691173)
pop_second <- c(4449049, 5320817, 6127700, 6916183)
pop_all <- c(pop_first, pop_second)
pop_all

world_pop[2]

world_pop[c(2, 4)]

world_pop[c(4, 2)]

world_pop[-3]

pop_million <- world_pop / 1000
pop_million

pop_rate <- world_pop / world_pop[1]
pop_rate

