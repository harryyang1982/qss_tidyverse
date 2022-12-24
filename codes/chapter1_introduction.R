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

getwd()
#setwd("")

UNpop <- read_csv("https://github.com/kosukeimai/qss/raw/master/INTRO/UNpop.csv")
class(UNpop)

## load the package
library(qss)

data(UNpop, package = "qss")
UNpop
#data(UNpop)
#UNpop

names(UNpop)
nrow(UNpop)
ncol(UNpop)
dim(UNpop)

UNpop %>% .$world.pop

UNpop[, "world.pop"]
UNpop[c(1, 2, 3), ]

UNpop[1:3, "year"]
slice(UNpop, n = 1:3)

select(UNpop, world.pop)

UNpop[1:3, "year"]

select(slice(UNpop, 1:3), year)

UNpop %>% 
  slice(1:3) %>% 
  select(year)

UNpop %>% 
  slice(seq(1, n(), by = 2)) %>% 
  select(world.pop)

UNpop %>% 
  filter(row_number() %% 2 == 1) %>% 
  select(world.pop)

pop_1970 <- UNpop %>% 
  filter(year == 1970) %>% 
  select(world.pop) %>% 
  pull() #return a vector, not a tibble

pop_1970

UNpop %>% 
  filter(year == 1970) %>% 
  select(world.pop) %>% 
  as_vector()

### 1.3.8 Adding Variables

UNpop_mill <- UNpop %>% 
  mutate(world_pop_mill = world.pop / 1000) %>% 
  select(-world.pop)
UNpop_mill

## adding a nonsense variable to the UNpop.mill data
UNpop_mill <- UNpop_mill %>% 
  mutate(nonsense_var = world_pop_mill / year)
UNpop_mill

UNpop_mill <- UNpop_mill %>% 
  mutate(after_1980 = case_when(year >= 1980 ~ 1, 
                                TRUE ~ 0))

specific_years <- c(1950, 1980, 2000)
UNpop_mill <- UNpop_mill %>% 
  mutate(year_of_interest = case_when(year %in% specific_years ~ 1, 
                                      TRUE ~ 0))
UNpop_mill

### 1.3.9. Data Frames: Summarizing

summary(UNpop_mill)

## add a row where value for each column is NA
UNpop_mill_wNAs <- UNpop_mill %>% 
  add_row(year = NA, world_pop_mill = NA,
          nonsense_var = NA, after_1980 = NA,
          year_of_interest = NA)
UNpop_mill_wNAs

## take the mean of world_pop_mill (returns NA)
mean(UNpop_mill_wNAs$world_pop_mill)

mean(UNpop_mill_wNAs$world_pop_mill, na.rm = TRUE)

UNpop_mill %>% 
  summarize(mean_pop = mean(world_pop_mill),
            median_pop = median(world_pop_mill))

UNpop_mill %>% 
  group_by(after_1980) %>% 
  summarize(mean_pop = mean(world_pop_mill))
