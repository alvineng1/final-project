# final-project
# INFO 201 Final Project

_by:
[Bryce Fukuda](https://github.com/fukudab/), [Steven Hsieh](https://github.com/hsiehsc),  [Alvine Ngouonga](https://github.com/alvineng1/), [Macey Schallert](https://github.com/macerose/)_

You can find a link to our final project [here](https://hsiehsc.shinyapps.io/final-project/)

## Project Description
### About this dataset
The dataset we will be working with is a [suicide rate overview from 1965-2016](https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016).

The information was collected by russellyates88, and sourced by the [World Bank](http://www.worldbank.org/). The dataset is hosted on [kaggle](https://www.kaggle.com).

The dataset seems to be targeted toward anyone with an interest in global and mental health. Mental health is gaining an increase in awareness and this data set can help provide numerical evidence to support research.

1. Which countries experience the highest rates of suicide?
2. How do economic and development indicators link to suicide rates?
3. What are the sex differences when it comes to suicide rates?
4. How has suicide rates increased or decreased per generation? If there is a trend, which countries does this trend exist for?
5. Which years were suicide rates most prevalent?

### Technical Description


The dataset that we acquired from Kaggle is a `.csv` file, so we will read in the data with the `read.csv` function in `R`. In order to wrangle the data, we will need to organize the data by country, age, wealth, generation, and sex. Some of the libraries that we plan on using are `leaflet` and `plotly` for visualization, `shiny` will be used to create the shiny webpage, `ggplot` will also be used to graph the data.

Potential challenges

1. Data wrangling: The data is 30,000 rows long and we do not know if the data provided is consistent throughout each column.
2. Shiny: We haven't had a lot of opportunities to work with `shiny` yet, so we anticipate to have issues with getting the website to work
3. Collaboration: Because of the pulling and pushing in github, we are afraid that we might lose some code
