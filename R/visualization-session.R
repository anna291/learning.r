# load packages from the "package-loading.R script
source(here::here("R/package-loading.R"))

# 1 dimension plots (1 variable) ------------------------------------------

ggplot(NHANES, aes(x = BMI)) +
  geom_density()

ggplot(NHANES, aes(x = BMI)) +
  geom_histogram()

ggplot(NHANES, aes(x = Education))

ggplot(NHANES, aes(x = Education)) +
  geom_bar()

# 2 dimension plots (2 variables) -----------------------------------------

two_nums <- ggplot(NHANES, aes(x = Age, y = BPSysAve))

two_nums +
  geom_point()

two_nums +
  geom_line()

two_nums +
  geom_hex()

two_nums +
  geom_smooth()

two_categ <- ggplot(NHANES, aes(x = Education,
                                fill = Diabetes))

two_categ +
  geom_bar()

two_categ +
  geom_bar(position = position_dodge())

two_mixed <- ggplot(NHANES, aes(x = Diabetes,
                                y = TotChol))

two_mixed +
  geom_boxplot()

NHANES %>%
  filter(!is.na(Diabetes)) %>%
  ggplot(aes(x = Diabetes, y = TotChol)) +
  geom_boxplot()

two_mixed +
  geom_jitter(width = 0.2)


# 3 or more dimensions (3 +variables) -------------------------------------

ggplot(NHANES, aes(x = BMI, y = BPSysAve,
                   colour = HomeOwn)) +
  geom_point()


ggplot(NHANES, aes(x = BMI, y = BPSysAve,
                   colour = HomeOwn)) +
  geom_smooth() +
  facet_grid(col = vars(Gender))


ggplot(NHANES, aes(x = BMI, y = BPSysAve,
                   colour = HomeOwn)) +
  geom_smooth() +
  facet_grid(rows = vars(Gender))


colour_plot_mixed <- NHANES %>%
  ggplot(aes(x = Gender, y = BPSysAve,
             colour = HomeOwn))

colour_plot_mixed +
  geom_boxplot()
