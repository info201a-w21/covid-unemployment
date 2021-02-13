install.packages("palmerpenguins")

ggplot(data = penguins) + 
    geom_histogram(mapping = aes(x=body_mass_g))

ggplot(data = penguins) +
  boxplot

ggplot(data = penguins) +
  geom_violin(mapping = aes(x=bil_length_nm, y = 1))


# One categorical varibale: how oftend oes each category
  by_species <- penguins %>%
    group_by(species)%>%
    count()
  
  ggplot(data = by_species) +
    geom_col(mapping = aes(x= specieis, y=n))
  
  #One categorical and one continuous: Is the continuous variable similarly disctiuted
  ggplot(data = penguins)+
      geom_histogram(mapping = aes(x=bill_length_nm, y = species))+
      facet_wrap(~species)
  ggplot(data = penguins)+
    geom_boxplot(mapping = aes(x=bill_length_nm, y = species))
  
  ggplot(data = penguins)+
      geom_violin(mapping = aes(x=bill_length_nm, y = species))
  
  # Compating 2 continuous variables to assess the correlations
  ggplot(data = penguins) +
      geom_point(mappping = aes(x = body_mass_g, y = bill_length_nm))
  
  # Multiple continuous varibales: scatterplot matrix
  continuous_vars <- penguins %>%
      select(bill_length, bill_depth_nm, flipper_length_nm, body_mass_nm)
    
  
  
  #Heatmap of species vs. island
  by_species_island <- penguins %>%
      group_by(species, island) %>%
      count()
  
  ggplot(by_species_island)%>%
  geom_tile(mapping = aes(x = species, y = island, fill = n))
  
  
  