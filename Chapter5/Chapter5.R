# load the library
library(tidyverse)
# to visualize categorical data, use a bar chart
# x axis = level of cut, y axis = #observations
# Why does not this y axis below work?
# ggplot(data = diamonds) +
#   geom_bar(mapping = aes(x = cut, y = diamonds %>% count(cut)))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
# use pipe operator(管道函数) %>% to see count of observations
diamonds %>%
  count(cut)
# to visualize continuous data, use a histogram
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = .5)
# see count of observations
diamonds %>%
  count(cut_width(carat, .5))
# visualize the histogram with both a smaller carat a smaller binwidth:
smaller <- diamonds %>%
  filter(carat < 3)
ggplot(data = smaller) +
  geom_histogram(mapping = aes(x = carat), binwidth = .1) 
# pg86 if we want to show more information on the graph
# for example, cut level, we use color(with different lines) to distinguish it
ggplot(data = smaller, mapping = aes(x = carat)) + 
  geom_freqpoly(aes(color = cut), binwidth = .1)
# visualize faithful dataset, eruptions type
ggplot(data = faithful, mapping = aes(x = eruptions)) + geom_histogram(binwidth = .25)
# trying to observe outlier, outlier is too small to observe
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = .5)
# so we use coord_cartesian() to change the range of axis
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = .5) +
  coord_cartesian(ylim = c(0, 50))
# after seeing the 3 unusual values, which are 0, 30, 60, we pluck them out by using filter
unusual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  arrange(y)
unusual
# replacing unusual value with NA, instead of deleting(filtering out) them
diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))
diamonds2
# missing point in data warning
ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point()
# to get rid of warning
ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point(na.rm = TRUE)


