


# ggplot example
gap <- gapminder::gapminder %>% filter(year > 2000)

ggplot(gap)


ggplot(gap,mapping = aes(gdpPercap,lifeExp))





ggplot(gap,mapping = aes(gdpPercap,lifeExp)) + 
  geom_point()







ggplot(gap,aes(gdpPercap,lifeExp)) + 
  geom_point()





ggplot(gap) + 
  geom_point(aes(gdpPercap,lifeExp))











ggplot(gap) + 
  geom_point(aes(gdpPercap,lifeExp)) +
  geom_line()



ggplot(gap,aes(gdpPercap,lifeExp)) + 
  geom_point() + 
  geom_line()


ggplot(gap,aes(gdpPercap,lifeExp)) + 
  geom_point() + 
  geom_line(aes(gdpPercap,lifeExp,group = country))


ggplot(gap,aes(gdpPercap,lifeExp,group = country)) + 
  geom_point() + 
  geom_line()


ggplot(gap,aes(gdpPercap,lifeExp,group = country)) + 
  geom_point(color = "red") + 
  geom_line(color = "blue")




ggplot(gap,aes(gdpPercap,lifeExp,group = country, color = continent)) + 
  geom_point() + 
  geom_line()



ggplot(gap,aes(gdpPercap,lifeExp,group = country, color = continent,size = pop)) + 
  geom_point() + 
  geom_line()


ggplot(gap,aes(gdpPercap,lifeExp,group = country, color = continent)) + 
  geom_point(aes(gdpPercap,lifeExp,group = country, color = continent,size = pop)) + 
  geom_line()


ggplot(gap,aes(gdpPercap,lifeExp,group = country, color = continent)) + 
  geom_point(aes(gdpPercap,lifeExp,group = country, color = continent,size = pop,alpha = pop)) + 
  geom_line()



ggplot(gap,aes(gdpPercap,lifeExp,group = country, color = continent)) + 
  geom_point(inherit.aes = F, aes(gdpPercap,lifeExp,group = country, color = continent,size = pop,alpha = pop)) + 
  geom_line() + 
  geom_smooth(inherit.aes = F, aes(gdpPercap,lifeExp),method = "lm")



ggplot(gap,aes(gdpPercap,lifeExp,group = country, color = continent)) + 
  geom_point(inherit.aes = F, aes(gdpPercap,lifeExp,group = country, color = continent,size = pop,alpha = pop)) + 
  geom_line() + 
  geom_smooth(inherit.aes = F, aes(gdpPercap,lifeExp),method = "lm",formula = y ~ log(x))






# Examples with dplyr & ggplot

gap %>% 
  filter(year == 2007)

gap %>% 
  filter(year == 2007) %>% 
  summarise(mean = mean(lifeExp))

gap %>% 
  filter(year == 2007) %>% 
  summarise(mean = mean(lifeExp),
            sd = sd(lifeExp))

gap %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(mean = mean(lifeExp),
            sd = sd(lifeExp))


gap %>% 
  group_by(continent) %>% 
  mutate(mean = mean(lifeExp),
         sd = sd(lifeExp))


gap %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(MeanLifeExp = mean(lifeExp)) %>% 
  ggplot(aes(continent,MeanLifeExp)) + 
    geom_col() +
    labs(title = "Year = 2007")











# Animation
library(gapminder)
library(gganimate)


p <- ggplot(gapminder::gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  theme(legend.position = 'none') +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

gganimate::animate(p, 100, 10)




