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

pop_increase <- world_pop[-1] - world_pop[-7]
percent_increase <- (pop_increase / world_pop[-7]) * 100
percent_increase

plot(x = seq(1960, 2010, 10), y = percent_increase)

percent_increase[c(1, 2)] <- c(20, 22)
percent_increase

### 1.3.6 functions

length(world_pop)

min(world_pop)

max(world_pop)

range(world_pop)[2] - range(world_pop)[1]

mean(world_pop)

sum(world_pop) / length(world_pop)

year <- seq(from = 1950, to = 2010, by = 10)
year

seq(to = 2010, by = 10, from = 1950)

seq(from = 2010, to = 1950, by = -10)
2008:2012
2012:2008

names(world_pop)
names(world_pop) <- year

names(world_pop)
world_pop

my_summary <- function(x) {
  s_out <- sum(x)
  l_out <- length(x)
  m_out <- s_out / l_out
  out <- c(s_out, l_out, m_out) # define the output
  names(out) <- c("sum", "length", "mean") # add labels
  return(out)
}

my_summary(world_pop)

z <- 1:10
my_summary(z)

### 1.3.7 data files: loading and subsetting

