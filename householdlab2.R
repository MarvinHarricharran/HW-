getwd()
setwd("C:/Users/marvi/Downloads/Household_Pulse_data_ph4c2")

library(tidyverse)
library(ggplot2)
library(dplyr)
library(readr)


load("Household_Pulse_data_ph4c2.RData")


#create the plots

ggplot(subset(Household_Pulse_data), aes(x=EEDUC, y=INCOME, fill = RECVDVACC))+
  geom_bar(stat = "identity", position = position_dodge2(0.9))


ggplot(Household_Pulse_data %>% group_by(EEDUC, RECVDVACC) %>% count(),
        aes(x=EEDUC, y=n, fill = RECVDVACC)) +
  geom_bar(stat='identity', position = 'dodge') +
  labs(
    title = 'Vax Status Compared to Edcuation',
    x = 'Education Status',
    y = 'Count of People',
    fill = 'Vax Status'
  ) + theme_minimal()



ggplot(Household_Pulse_data %>% group_by(TBIRTH_YEAR, RECVDVACC) %>% count(),
                    aes(x=TBIRTH_YEAR, y=n, fill = RECVDVACC)) +
  geom_bar(stat='identity', position = 'dodge') +
  labs(
    title = 'Vax Status Compared to Birth Year',
    x = 'Birth Year',
    y = 'Count of People',
    fill = 'Vax Status'
  ) + theme_light()

  

ggplot(Household_Pulse_data %>% group_by(INCOME, RECVDVACC) %>% count(),
       aes(x=INCOME, y=n, fill = RECVDVACC)) +
  geom_bar(stat='identity', position = 'dodge') +
  labs(
    title = 'Vax Status Compared to Income',
    x = 'Income',
    y = 'Count of People',
    fill = 'Vax Status'
  ) + theme_gray()



Household_Pulse_data %>% 
  group_by(INCOME, RECVDVACC, TBIRTH_YEAR) %>%
  count() %>%
  ungroup() %>%
  arrange(INCOME,RECVDVACC, TBIRTH_YEAR)


ggplot(Household_Pulse_data,
               aes(x= EEDUC, y = TBIRTH_YEAR, color = as.factor(RECVDVACC), group = RECVDVACC)) +
  geom_jitter() +
  labs(
    title = 'Vax Status Compared to Eductaion and Birth Year',
    x ="Education", y= "Birth Year", color = "Vax Status") +
  theme_minimal()



ggplot(Household_Pulse_data,
       aes(x= INCOME, y = TBIRTH_YEAR, color = as.factor(RECVDVACC), group = RECVDVACC)) +
  geom_jitter() +
  labs(
    title = 'Vax Status Compared to Income and Birth Year',
    x ="Income", y= "Birth Year", color = "Vax Status") +
  theme_minimal()

