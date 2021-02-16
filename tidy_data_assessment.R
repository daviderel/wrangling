# 
# d <- read_csv("times.csv")
# head (d)
# 
# #tidy_data <- d %>%
# #  gather(year, time, `2015`:`2017`)
# 
# 
# 
# tidy_data <- d %>%
#   gather(key = 'key', value = 'value', -age_group) %>%
#   separate(col = key, into = c('year', 'variable_name'), sep = '_') %>% 
#   spread(key = variable_name, value = value)
# 
# head(tidy_data)

co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

head(co2_wide)

co2_tidy<-gather(co2_wide,month,co2,-year)

head(co2_tidy)

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()

library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)

head(dat)

dat_tidy <- spread(dat, gender, admitted)

tmp <- gather(admissions, key, value, admitted:applicants)
tmp

tmp2<-unite(tmp,column_name,c(key,gender))
head(tmp2)