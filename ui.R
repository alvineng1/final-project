# Load relevent Libraries
library(ggplot2)
library(shiny)
library(dplyr)
library(shinythemes)
library(plotly)

source("scripts/scatter-function.R")

############################ Introduction ############################
introduction <- tabPanel(
  "Introduction",
  mainPanel(
    tags$h4(strong("Information about Suicide", style = "color: #93032E;")),
    tags$h6(em("March 14th, 2019")),
    tags$p("According to the WHO, close to 800,000 people die from
            suicide each year. Suicide has a devastating and
            radiating effect on the
            families and communities impacted by suicide.
            Suicide can occur at any time
            in life but mainly impacts 15-29-year-olds globally.
            Suicide is nondiscriminatory, as it impacts both low
            and high income countries,
            which is why it is such a huge public health concern."),
    tags$h4(strong("Information about the Dataset", style = "color: #93032E;")),
    tags$p(
      "The information was collected by",
      em("russellyates88"), "and sourced by
          the World Bank. The dataset was hosted on Kaggle
          and is targeted towards
          individuals who have an interest in global and
          mental health. This data set can help provide
          numerical evidence to support research on mental health."
    ),
    tags$a(
      href = "https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016",
      "You can find a link to the data by clicking here."
    ),
    tags$h4(strong("Questions that can be asked", style = "color: #93032E;")),
    tags$p("The data set is 30,000 rows long and summarizes information by
            country, year, age group, generation, and GDP.
            Some of the questions that we
            attempt to answer with this data set include:"),
    tags$ol(
      tags$li("Which countries experience the highest rates of suicide?"),
      tags$li("How do economic and development
              indicators link to suicide rates?"),
      tags$li("What are the sex differences when it comes to suicide rates?"),
      tags$li("How has suicide rates increased or decreased per generation?
               If there is a trend, which countries
               does this trend exist for?"),
      tags$li("Which years were suicide rates most prevalent?")
    ),
    tags$h4(strong("Structure", style = "color: #93032E;")),
    tags$p("The first tab of this report shows has a
            choropleth map of the number of suicides
            in each country. Users can change the year
            input to see how suicides vary in each
            country from 1985 to 2016.
            The second page shows a generational bar
            plot of suicides per country and per year.
            Users can select the country and the year
            and see how many suicides occurred per in each
            generation. The third plot is a scatter plot
            that looks at the changes in suicide vs gpd
            for each country from 1985 to 2016."),
    tags$h4(strong("Creators", style = "color: #93032E;")),
    tags$ol(
      tags$li("Bryce Fukada"),
      tags$li("Alvine Ngouonga"),
      tags$li("Steven Hsieh"),
      tags$li("Macey Schallert")
    )
  )
)


################################ MAP #################################

map <- tabPanel(
  "Map of Suicide",
  titlePanel("Suicides by Year"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "years",
        label = "In year:",
        min = 1985,
        max = 2016,
        value = 1998,
        sep = ""
      )
    ),
    mainPanel(
      tags$h3(strong("Map of Suicides"), align = "center"),
      plotlyOutput("plot"),
      tags$tav,
      tags$p("This map shows the number of suicides from
              different countries around
              the world from 1985 to 2016. The countries
              that are more pigmented are those
              with the highest rates of suicide."),
      tags$p(strong("To use this map:"), "use the slider to
                                          select the year that you are
                        interested in and the map will adjust the suicide rates
                        according to the year chosen.
              Please keep in mind that this map was created using a data set
              that did not include the
              suicide rates for each country in the world for each year."),
      tags$h5(strong
      (em("Possible Questions You Could Ask About the Dataset:",
          style = "color: #034C3C;"
      ))),
      tags$ol(
        tags$li("There are some countries that seem
                 to have zero rates of suicide.
                 Why do you think that is?"),
        tags$li("Why do some countries have higher reported rates of suicides
                than others?"),
        tags$li("Are there social or economic factors that might cause suicides
                to be more common
                in some countries and not in others?")
      ),
      tags$h5(
        strong("Insights:", style = "color: #84894A;")
      ),
      tags$p(
        "Overall, We noticed that certain countries like the",
        strong("United States"),
        "had relatively high rates of suicide throughout the time period
              of 1985 to 2016.
              Other countries like", strong("Russia"), "started having high
              suicide rates around
              1989, and the suicide rates in Russia stayed comparable with
              that of the United States
              from 1989 to 2015."
      )
    )
  )
)




############################# Generation #############################

generation <- tabPanel(
  "Generation",
  titlePanel("Generation Plot"),
  # Creating sidebar layout
  sidebarLayout(
    # Sidebar Panel
    sidebarPanel(
      # Input to select variable to map
      selectInput("country_text_name", "Select Country",
        country_list,
        selectize = TRUE
      ),
      sliderInput("slider_year",
        label = h3("Select Year"), min = 1985,
        max = 2016, value = 2000, sep = ""
      ),
      checkboxInput("gender_checkbox", label = "Show Sex", value = TRUE)
    ),
    # Main Panel to Show Bar Plot
    mainPanel(
      plotlyOutput("generation"),
      tags$p("This is a visualization of a bar chart detailing generations
              and their suicide rate. You can select a specific country on
              the left, as well as the year for that country.
              Note that not all years will have data on all generations
              as they have not been born yet. Additionally, not all countries
              have years for all the data, and this is represented by
              empty graphs."),
      tags$p(
        strong("To use this map:"), "Look at the side panel on the top left side
              of the page. You can select the country of interest with the",
        strong("country"), "dropdown menu. You can also select the year of
        interest with the",
        strong("year"), "slider bar. Hover above the bar to know how many
                         suicides occurred
                         for inputs selected."
      ),
      tags$h5(strong(
        em("Possible Questions You Could Ask About the Dataset:",
          style = "color: #034C3C;"
        )
      )),
      tags$ol(
        tags$li("Which country has the largest number of suicides for all
                generations?"),
        tags$li("Why would some generations have larger rates of suicides for
                certain years?"),
        tags$li("Are there social or economic factors that might cause suicides
                 to be more common
                 in some generations than others?")
      ),
      tags$h5(
        strong("Insights:", style = "color: #84894A;")
      ),
      tags$ol(
        tags$li(
          "Males vastly outnumber females,
          often at a ratio of 4 males to every one female"
        ),
        tags$li(
          "Boomers maintain a high rate of suicide for most of the years
          until the most recent ones. This might be related to the boomers
          being affected the most by economic downturns which could cause
          an increase in suicide rates."
        ),
        tags$li(
          "Millennial have the lowest rates of suicide. They're also the
           youngest, However, Millennial suicides are beginning to increase.
           This might be due
           to the influence of social media and changing perceptions of success"
        )
      )
    )
  )
)


############################### Scatter ###############################

scatter <- tabPanel(
  "Scatter Plot",
  titlePanel("Suicide Rates by GDP per Capita"),
  # Creating sidebar layout
  sidebarLayout(
    # Sidebar Panel
    sidebarPanel(
      # Input to select country to map
      selectInput(
        inputId = "country",
        label = "Select Country",
        choices = select_values,
        selected = "China"
      )
    ),
    mainPanel(
      tags$h4(strong("Suicide Scatter Plot"), align = "center"),
      plotlyOutput("scatter"),
      tags$p("This scatter plot shows the trend of suicides
              in each country in our dataset from 1985-2016
              (with respect to gdp).
              In total, there are 2321 countries from this
              data set that are graphed on the plot. Keep in mind
              that some countries do not have rates of suicides
              for certain years, and not all of the
              countries in the world are represented in this
              data set as well."),
      tags$p(
        strong("To use this map:"), "Look at the side panel on the
              top left side
              of the page. You can select the country of interest with the",
        strong("country"), "dropdown menu. Once you select the country,
              the scatter plot will display
              the information for suicide rates from 1985-2016 for that
              specific country."
      ),
      tags$h5(strong(em("Possible Questions You Could Ask About the Plot:",
        style = "color: #034C3C;"
      ))),
      tags$ol(
        tags$li("Which countries had a decrease or increase in suicides?"),
        tags$li("Are there any countries that have a direct correlation
                between suicides and gdp?"),
        tags$li("Are there social or economic factors that might cause
                 suicides to be more common
                 in some countries and not in others?")
      ),
      tags$h5(
        strong("Insights:", style = "color: #84894A;")
      ),
      tags$p("The general trend seems to be split depending on the country.
             For some countries, like Brazil and Chile, as GDP goes up, so
             do suicide rates- resulting in a positive correlation.
             For countries like France, Italy, and the United Kingdom,
             a negative correlation occurs where GDP decreases,
             suicide rates increase. It is interesting to note the unique trend
             line of the United States: a GDP above and below a certain amount
             results in higher suicide rates, but if the GDP falls
             within the median range, suicide rates stay on the lower
             end of the scale."),
      tags$br(),
      plotlyOutput("new"),
      tags$p("This scatter plot shows a more detailed view of suicide rates over
              time for each country. The x axis
              has the year and the y axis depicts the rate of suicide per
              100K."),
      tags$p(strong("To use this scatter plot:"), "Look at the side panel on
            the top left side of the page.
            You can select the country of interest with
            the", strong("country"), "dropdown menu. Once you select the
            country, the scatter plot will display the information for suicide
            rates from 1985-2016 of that country."),
      tags$h5(strong(em("Possible Questions You Could Ask About the Plot:"))),
      tags$ol(
        tags$li("Why do some countries have a decrease in suicide rates
                over time?"),
        tags$li("Are there social or economic factors that might cause
                  suicides to be more common
                 in some countries and not in others?")
    )
  )
)
)




############################## About Us ##############################

about_us <- tabPanel(
  "Meet the Team",
  headerPanel(
    h4("About Us",
      style = "font-family: 'Arial';cursive;
         font-size: 25px; line-height: 1.0:
         color: #36454f;
         text-align: center;
         font-weight: 300;"
    )
  ),
  tags$h4("This report was created by the students in INFO 201 at the
           University of Washington. It was created by",
    strong("Alvine Ngouonga,
        Bryce Fukuda,
        Macey Schallert,
        and Steven Hsieh."),
    align = "center"
  ),
  sidebarPanel(
    tags$h4(strong("Alvine Ngouonga"), align = "middle"),
    tags$img(
      src = "http://tinyurl.com/y6grzsc6", height = "200 px",
      style = "display: block; margin-left: auto; margin-right: auto;"
    ),
    tags$p("Alvine Ngouonga is a Sophomore at the University of
           Washington studying Medical
           Anthropology and Global Health with a minor in Informatics
           and Bioethics. She hopes
           to pursue a career in medicine and/or Global Health to study
           women's reproductive health.")
  ),
  sidebarPanel(
    tags$h4(strong("Bryce Fukuda"), align = "center"),
    tags$img(
      src = "http://tinyurl.com/yylsa9cx", height = "200 px",
      style = "display: block; margin-left: auto; margin-right: auto;"
    ),
    tags$p("Bryce Fukuda is a Senior at the Univesity of Washington
           Studying Molecular, Cellular, and
           Developmental Biology. He hopes to utilize the skill sets
           learned in R to analyze biological
           datasets and potential future projects.")
  ),
  sidebarPanel(
    tags$h4(strong("Macey Schallert"), align = "center"),
    tags$img(
      src = "http://tinyurl.com/y6bbhkoo", height = "200 px",
      style = "display: block; margin-left: auto; margin-right: auto;"
    ),
    tags$p("Macey Schallert is a Junior at the University of Washington
          studying Psychology and Anthropology.
          She intends to apply R programming to Psychology research in
          Clinical Psychology, specifically
          substance abuse research.")
  ),
  sidebarPanel(
    tags$h4(strong("Steven Hsieh"), align = "center"),
    tags$img(
      src = "http://tinyurl.com/y2m2n76j", height = "200 px",
      style = "display: block; margin-left: auto; margin-right: auto;"
    ),
    tags$p("Steven Hsieh is a Junior at the University of Washington
            studying Finance. With R, he wishes to make pretty
            graphs and cool visualizations that also show information in
            a meaningful way.")
  )
)


############################## Shiny UI ##############################

shinyUI(navbarPage(
  theme = shinytheme("yeti"),
  "Suicides Around the World",
  introduction,
  map,
  generation,
  scatter,
  about_us
))


?headerPanel
