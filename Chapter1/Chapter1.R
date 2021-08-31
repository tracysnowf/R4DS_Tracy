# load library
library(tidyverse)
# create a mpg object
mpg <- ggplot2::mpg
# plot mpg pg5
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
# mapping colors of dots to class from the mpg data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


