library(ggplot2)
library(MASS) # birthwt

g <- ggplot(birthwt, aes(x = facotr(race), y = bwt)) + geom_boxplot()
plot(g)

# change boxsize
g <- ggplot(birthwt, aes(x = factor(race), y = bwt)) + geom_boxplot(width = .5)
plot(g)

# change outlier
g <- ggplot(birthwt, aes(x = factor(race), y = bwt)) + geom_boxplot(outlier.size = 1.5,
                                                                    outlier.shape = 21)
plot(g)

# fix x, exclude x scale and label
g <- ggplot(birthwt, aes(x = 1, y = bwt)) + geom_boxplot() + scale_x_continuous(breaks = NULL) + theme(axis.title.x = elmenet_blank())
plot(g)

# add average
g <- ggplot(birthwt, aes(x = factor(race), y = bwt)) + geom_boxplot() + stat_summary(fun.y = "mean", geom = "point", shape = 23, size = 3, fill = "white")
plot(g)