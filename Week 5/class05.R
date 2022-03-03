#' ---
#' title : "Class 5 Lab"
#' author : "Yash Garodia (PID: A16165682)"
#' date: "Febuary 1st, 2022"
#' ---
library(ggplot2)
ggplot(cars)
ggplot(cars) + aes(x = speed, y = dist)
ggplot(cars) + aes(x = speed, y = dist) + geom_point()
ggplot(cars) + aes(x = speed, y = dist) + geom_point()+geom_smooth()
ggplot(cars) + aes(x = speed, y = dist) + geom_point()+geom_smooth() + theme_bw() + labs(title = "Speed Distance Relationship Between Cars", subtitle = "Random survey 2020")
ggplot(cars) + aes(x = speed, y = dist) + geom_point()+geom_smooth() + theme_bw() + labs(title = "Speed Distance Relationship Between Cars", subtitle = "Random survey 2020", x = "Speed (mph)", y = "Distance (m)", caption = "dataset :cars")
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
nrow(genes)
ncol(genes)
colnames(genes)
summary(genes)
table(genes$state)
ggplot(data = genes) + aes(x = Condition1,y = Condition2) + geom_point()
p <- ggplot(data = genes) + aes(x = Condition1,y = Condition2, col = State) + geom_point()
p
p<-p + scale_color_manual(values = c("blue", "gray", "red"))
p
p <- p + labs(title = "Gene Expression Changes Upon Drug Treatment", y = "Drug Treatment", x = "Control (no drug)"
)
p
# install.packages("gapminder")
library(gapminder)
library(dplyr)
gapminder_2007 <- gapminder %>% filter(year == 2007)
ggplot(gapminder_2007) + aes(y = lifeExp, x = gdpPercap) + geom_point()
ggplot(gapminder_2007) + aes(y = lifeExp, x = gdpPercap) + geom_point(alpha = 0.4)
ggplot(gapminder_2007) + aes(y = lifeExp, x = gdpPercap, color = continent, size = pop) + geom_point(alpha = 0.4)
ggplot(gapminder_2007) + aes(y = lifeExp, x = gdpPercap, color = pop) + geom_point(alpha = 0.8)
ggplot(gapminder_2007) + aes(y = lifeExp, x = gdpPercap, size = pop) + geom_point(alpha = 0.4)
ggplot(gapminder_2007) + aes(y = lifeExp, x = gdpPercap, size = pop) + geom_point(alpha = 0.4) + scale_size_area(max_size = 10)
gapminder_1957 <- gapminder %>% filter(year == 1957)
ggplot(gapminder_1957) + aes(x = gdpPercap, y = lifeExp, color = continent, size = pop) + scale_size_area(max_size = 15) + geom_point(alpha = 0.7)
gapminder_1957 <- gapminder %>% filter(year == 1957 | year == 2007)
ggplot(gapminder_1957) + aes(x = gdpPercap, y = lifeExp, color = continent, size = pop) + scale_size_area(max_size = 15) + geom_point(alpha = 0.7) + facet_wrap(~year)
gapminder_top5 <- gapminder %>% filter(year == 2007) %>% arrange(desc(pop)) %>% top_n(5, pop)
gapminder_top5
ggplot(gapminder_top5) + geom_col(aes(x = country, y= pop))
ggplot(gapminder_top5) + geom_col(aes(x = country, y = lifeExp))
ggplot(gapminder_top5) + geom_col(aes(x = country, y = lifeExp, fill = continent))
ggplot(gapminder_top5) + geom_col(aes(x = country, y= pop, fill = continent))
ggplot(gapminder_top5) + geom_col(aes(x = country, y= pop, fill = lifeExp))
ggplot(gapminder_top5) + geom_col(aes(x = country, y= pop, fill = gdpPercap))
ggplot(gapminder_top5) + geom_col(aes(x = reorder(country, -pop), y= pop, fill = gdpPercap))
ggplot(gapminder_top5) + geom_col(aes(x = reorder(country, -pop), y= pop, fill = country), col = "gray30") + guides(fill = FALSE)
head(USArrests)
USArrests$State <- rownames(USArrests)
ggplot(USArrests) + aes(x = reorder(State, Murder), y = Murder) + geom_col() + coord_flip()
ggplot(USArrests) + aes(x = reorder(State, Murder), y = Murder) + geom_point() + geom_segment(aes(x = State, xend = State, y = 0, yend = Murder), color = "blue") + coord_flip()
library(gapminder)
# install.packages("gifski")
# install.packages("png")
# install.packages("gganimate")
library(gifski)
library(png)
library(gganimate)
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  shadow_wake(wake_length = 0.1, alpha = FALSE)
# install.packages("patchwork")
library(patchwork)
p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))
(p1 | p2 | p3) /
  p4
sessionInfo()