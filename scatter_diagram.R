# A basic scatter diagram displays the relationship between two continuous value variables.
library(ggplot2)
library(gcookbook) # heightweight
library(dplyr)

# I want to create a scatterplot using two continuous value variables.
# defalt size : 2
# change size and shape
# shape : 0 ~ 25, "*", ".", "o", "O", "0", "+", "-", "|", "%", "#"
g <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 21, size = 1.5)
plot(g)

# I want to use a variable (for grouping) to visibly group points by color or shape.
# change colour and shape
g <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point() + 
  scale_shape_manual(values = c(1,2)) + scale_colour_brewer(palette = "Set1")
plot(g)

# I want to set the shape of a point to be different from the default.
# make data.frame : weight < 100, weight >= 100
hw <- heightweight %>% 
  mutate(weightgroup = ifelse(weightLb < 100, "< 100", ">= 100"))
# shape = sex, fill = weightgroup, colour = (NA, "black")
g <- ggplot(hw, aes(x = ageYear, y = heightIn, shape = sex, fill = weightgroup)) + 
  geom_point(size = 2.5) + 
  scale_shape_manual(values = c(21, 24)) + 
  scale_fill_manual(
    values = c(NA, "black"), 
    guide = guide_legend(override.aes = list(shape = 21))
  )
plot(g)

# I want to represent the color and size of a point using a third continuous value variable.
# I can use guide_legend() to use a discrete legend instead of a color bar.
g <- ggplot(heightweight, aes(x = ageYear, y = heightIn, fill = weightLb)) + 
  geom_point(shape = 21, size = 2.5) + 
  scale_fill_gradient(
    low = "black", high = "white", 
    breaks = seq(70, 170, by = 20), 
    guide = guide_legend()
  )
plot(g)

# I want to fit the lines of the regression model to the scatter plot.
g <- ggplot(heightweight, aes(x = ageYear, y = heightIn))

# 99% confidence interval
g1 <- g + geom_point() + stat_smooth(method = lm, level = 0.99)
plot(g1)

# No confidence interval
g1 <- g + geom_point() + stat_smooth(medho = lm, se = FALSE)
plot(g1)

# Black regression models and gray dots
g1 <- g + geom_point(colour = "grey60") + stat_smooth(method = lm, se = FALSE, colour = "black")
plot(g1)