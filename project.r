library(GGally)
library(ggplot2)
library(tidyverse)
library(ggExtra)
data <- read.csv("Tamil_movies_dataset.csv")
#data$Age <- as.factor(data$Age)
#data$age_range <- cut(data$Age, breaks = seq(20, 80, by = 10))
#GRAPH 1
plot1 <- ggplot(data = data) +
  geom_bar(mapping = aes(x = Year, fill = PeopleVote, group = PeopleVote)) +
  theme(legend.position = "none")
ggsave("plot1.png", plot1)

#GRAPH 2
plot2 <- ggpairs(data, columns = c("Rating", "PeopleVote",
                                   "Year", "movie_rating", "content_rating"),
                 title = "Scatterplot Matrix for Movies Data")
ggsave("plot2.png", plot2)

#GRAPH 3
plot3 <- ggplot(data = data, aes(x = Year,
                                 y = Rating, group = Year)) +
  geom_boxplot() +
  labs(x = "Year", y = "Rating",
       title = "Box Plot of Rating by Year")
ggsave("plot3.png", plot3)

#GRAPH 4
plot4 <- ggplot(data = data) +
  geom_point(aes(x = Hero_Rating, y = movie_rating,
                 color = Year),
             size = 4, shape = 3)
ggsave("plot4.png", plot4)

#GRAPH 5
plot5 <- ggplot(data, aes(x = Rating)) +
  geom_histogram() +
  scale_fill_brewer(palette = "Set1")
ggsave("plot5.png", plot5)

#GRAPH 6
p <- ggplot(data, aes(x = Year, y = PeopleVote,
                      color = Year, size = Year)) +
  geom_point() +
  theme(legend.position = "none")
plot6 <- ggMarginal(p, type = "histogram", color = "red", fill = "slateblue")
ggsave("plot6.png", plot6)

#GRAPH 7
plot7 <- ggplot(data = data, aes(x = Year, y = PeopleVote)) +
  geom_point() +
  stat_smooth(method = lm, col = "red")
ggsave("plot7.png",plot7)