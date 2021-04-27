library(blogdown)
library(knitr)
library(tibble)
library(glue)
library(googlesheets4)
library(dplyr)
id <- "1szi9SA4sKl9Fmh-MWrepS1M9T36-HLvMSpyW9RJh-ws"


## Publications ----------------------------------------------------


d <- googlesheets4::range_read(googlesheets4::as_sheets_id(id),
                               sheet="publications")

### books -----------------------------------------------------------
books <- d %>% filter(type %in% c("dissertation", "book", "book chapter")) %>%
  arrange(desc(year)) %>%
  select(year, title, authors, journal, details, doi, url_hal, url_pdf,
         url_code, url_slides, url_custom1_name, url_custom1_link) %>%
  mutate(authors_bf = sub(authors, pattern="Rau, A.", 
                          replacement="**Rau, A.**"),
         journal_it = paste0("*",journal,"*")) %>%
  mutate(details_full = ifelse(is.na(details), ".", paste0(", ", details))) %>%
  mutate(url_hal_full = ifelse(is.na(url_hal), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_hal}" target="_blank" rel="noopener"> 
HAL 
</a>   
'))) %>%
  mutate(url_pdf_full = ifelse(is.na(url_pdf), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_pdf}" target="_blank" rel="noopener"> 
PDF 
</a>   
'))) %>%
  mutate(url_code_full = ifelse(is.na(url_code), " ",
                                glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_code}" target="_blank" rel="noopener"> 
Code 
</a>   
'))) %>%
  mutate(url_slides_full = ifelse(is.na(url_slides), " ",
                                  glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_slides}" target="_blank" rel="noopener"> 
Slides
</a>  
'))) %>%
  mutate(url_custom_full = ifelse(is.na(url_custom1_name), " ",
                                  glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_custom1_link}" target="_blank" rel="noopener"> 
{url_custom1_name} 
</a>  
'))) %>%
  mutate(full = 
           glue("1. {authors_bf} ({year}) {title}. {journal_it}, {details}.
                {url_hal_full}{url_pdf_full}{url_code_full}{url_slides_full}{url_custom_full}")) %>%
  select(full)

### articles -----------------------------------------------------------
articles <- d %>% 
  filter(type %in% c("article")) %>%
  arrange(desc(year)) %>%
  select(year, title, authors, journal, details, doi, url_hal, url_pdf,
         url_preprint, url_software,
         url_code, url_custom1_name, url_custom1_link, project) %>%
  mutate(authors_bf = sub(authors, pattern="Rau, A.", 
                          replacement="**Rau, A.**"),
         journal_it = paste0("*",journal,"*")) %>%
  mutate(details_full = ifelse(is.na(details), ".", paste0(", ", details))) %>%
  mutate(doi_full = ifelse(is.na(doi), ".", paste0(". ", "https://dx.doi.org/",doi))) %>%
  mutate(url_hal_full = ifelse(is.na(url_hal), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_hal}" target="_blank" rel="noopener"> 
HAL 
</a>   
'))) %>%
  mutate(url_pdf_full = ifelse(is.na(url_pdf), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_pdf}" target="_blank" rel="noopener"> 
PDF 
</a>   
'))) %>%
  mutate(url_preprint_full = ifelse(is.na(url_preprint), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_preprint}" target="_blank" rel="noopener"> 
Preprint 
</a>   
'))) %>%
  mutate(url_software_full = ifelse(is.na(url_software), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_software}" target="_blank" rel="noopener"> 
Software 
</a>   
'))) %>%
  mutate(url_code_full = ifelse(is.na(url_code), " ",
                                glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_code}" target="_blank" rel="noopener"> 
Code 
</a>   
'))) %>%
  mutate(url_custom_full = ifelse(is.na(url_custom1_name), " ",
                                  glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_custom1_link}" target="_blank" rel="noopener"> 
{url_custom1_name} 
</a>  
'))) %>%
  mutate(full = 
           glue("1. {authors_bf} ({year}) {title}. {journal_it}, {details}.
                {url_hal_full}{url_pdf_full}{url_preprint_full}{url_software_full}{url_code_full}{url_custom_full}"),
         full2 = glue("* {authors_bf} ({year}) {title}. {journal_it}, {details}.
                {url_hal_full}{url_pdf_full}{url_preprint_full}{url_software_full}{url_code_full}{url_custom_full}"))

### other -----------------------------------------------------------------------
other <- d %>% 
  filter(type %in% c("other", "submitted", "techreport", "conference")) %>%
  arrange(desc(year)) %>%
  select(year, title, authors, journal, details, doi, url_hal, url_pdf,
         url_preprint, url_software,
         url_code, url_custom1_name, url_custom1_link) %>%
  mutate(authors_bf = sub(authors, pattern="Rau, A.", 
                          replacement="**Rau, A.**"),
         journal_it = ifelse(is.na(journal), ".", paste0(". *",journal,"*"))) %>%
  mutate(details_full = ifelse(is.na(details), ".", paste0(" ", details))) %>%
  mutate(details_full = ifelse(is.na(details), ".", paste0(", ", details))) %>%
  mutate(doi_full = ifelse(is.na(doi), ".", paste0(". ", "https://dx.doi.org/",doi))) %>%
  mutate(url_hal_full = ifelse(is.na(url_hal), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_hal}" target="_blank" rel="noopener"> 
HAL 
</a>   
'))) %>%
  mutate(url_pdf_full = ifelse(is.na(url_pdf), " ",
                               glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_pdf}" target="_blank" rel="noopener"> 
PDF 
</a>   
'))) %>%
  mutate(url_preprint_full = ifelse(is.na(url_preprint), " ",
                                    glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_preprint}" target="_blank" rel="noopener"> 
Preprint 
</a>   
'))) %>%
  mutate(url_software_full = ifelse(is.na(url_software), " ",
                                    glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_software}" target="_blank" rel="noopener"> 
Software 
</a>   
'))) %>%
  mutate(url_code_full = ifelse(is.na(url_code), " ",
                                glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_code}" target="_blank" rel="noopener"> 
Code 
</a>   
'))) %>%
  mutate(url_custom_full = ifelse(is.na(url_custom1_name), " ",
                                  glue('
<a class="btn btn-primary btn-outline btn-xs"   href="{url_custom1_link}" target="_blank" rel="noopener"> 
{url_custom1_name} 
</a>  
'))) %>%
  mutate(full = 
           glue("1. {authors_bf} ({year}) {title}{journal_it}{details_full}.
                {url_hal_full}{url_pdf_full}{url_preprint_full}{url_software_full}{url_code_full}{url_custom_full}")) %>%
  select(full)

### format all publications -----------------------------------------------------
publications <- glue(
'+++
# Recent Publications widget.
# This widget displays recent publications from `content/publication/`.
widget = "custom"
active = true
date = 2016-04-20

title = "Publications"
subtitle = ""

# Order that this section will appear in.
weight = 30

+++

## Dissertations, books & book chapters
',
paste0(books$full, collapse = "\n"),
'

## Peer-reviewed publications
',
paste0(articles$full, collapse = "\n"),
'

## Pre-prints, technical reports, and other publications
',
paste0(other$full, collapse = "\n")
)

write.table(publications, 
            file = "content/home/publications.md", 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")
  



## Software ----------------------------------------------------

d <- googlesheets4::range_read(googlesheets4::as_sheets_id(id),
                               sheet="software")
packages <- d %>% 
  mutate(full1 = glue("1. **{title}**: {description}, available at [{repo}]({url_software})  "),
         full2 = glue("1. **{title}**: {description}, available as a [{repo}]({url_software})  "),
         full1b = glue("* **{title}**: {description}, available at [{repo}]({url_software})  "),
         full2b = glue("* **{title}**: {description}, available as a [{repo}]({url_software})  ")
         ) %>%
  mutate(full = ifelse(repo == "Shiny web app", full2, full1)) %>%
  mutate(fullb = ifelse(repo == "Shiny web app", full2b, full1b)) %>%
  mutate(full = as_glue(full)) %>% 
  mutate(fullb = as_glue(fullb))

software <- glue(
  '+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = "2016-04-20T00:00:00"

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Software"
subtitle = ""

# Order that this section will appear in.
weight = 50

+++

',
  paste0(packages$full, collapse = "\n")
)

write.table(software, 
            file = "content/home/software.md", 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")


## Advising ----------------------------------------------------


d <- googlesheets4::range_read(googlesheets4::as_sheets_id(id),
                               sheet="advising")
primary <- d %>%
  mutate(desc = glue("{name} ({type})")) %>%
  mutate(desc2 = ifelse(!is.na(cosupervision), 
                        glue("{title} (with {cosupervision})"), 
                        glue("{title}"))) %>% filter(desc2 != "NA") %>%
  mutate(full = glue("- **{name}** ({year}, {type}): {desc2}"))

secondary <- d %>% 
  mutate(desc = glue("{name} ({type})")) %>%
  mutate(desc2 = ifelse(!is.na(cosupervision), 
                        glue("{title} (with {cosupervision})"), 
                        glue("{title}"))) %>% 
  filter(desc2 == "NA") %>%
  mutate(full = glue("- **{name}** ({year}, {type})"))

advising <- glue(
  '+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = "2016-04-20T00:00:00"

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Advising & Teaching"
subtitle = ""

# Order that this section will appear in.
weight = 60

+++

',
  paste0(primary$full, collapse = "\n"),
  '
  
---
  
',
  paste0(secondary$full, collapse = "\n"),
)

write.table(advising, 
            file = "content/home/advising.md", 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")


## Talks ----------------------------------------------------

d <- googlesheets4::range_read(googlesheets4::as_sheets_id(id),
                               sheet="talks")
talks <- d %>% 
  filter(!is.na(url_slides) | !is.na(project)) %>%
  arrange(desc(date)) %>%
  select(type, date, time_start, time_end, title, 
         abstract, event, event_url, location,
         url_slides, url_video, project, embed) %>%
  mutate(abstract = ifelse(is.na(abstract), "", abstract),
         url_slides = ifelse(is.na(url_slides), "", url_slides),
         url_video = ifelse(is.na(url_video), "", url_video),
         project = ifelse(is.na(project), "", project),
         embed = ifelse(is.na(embed), "", embed))

for(i in 1:nrow(talks)) {
  choose <- talks %>% slice(i)
  all_talks <- glue(
'+++
date = 2017-01-01T00:00:00  # Schedule page publish date.

title = "', choose$title, '"
time_start = ', choose$date, 'T', choose$time_start, ':00
time_end = ', choose$date, 'T', choose$time_end, ':00
abstract = "', choose$abstract, '"
abstract_short = ""
event = "', choose$event, '"
event_url = "', choose$event_url, '"
location = "', choose$location, '"

# Is this a selected talk? (true/false)
selected = false

# Projects (optional).
#   Associate this talk with one or more of your projects.
projects = ["', choose$project, '"]
tags = ["', choose$project, '"]

# Links (optional).
url_pdf = ""
url_slides = "', choose$url_slides, '"
url_video = "', choose$url_video, '"
url_code = ""

# Does the content use math formatting?
math = true

# Does the content use source code highlighting?
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# [header]
# image = "headers/bubbles-wide.jpg"
# caption = "My caption :smile:"

+++

', choose$embed
  )
  write.table(all_talks, 
              file = paste0("content/talk/", choose$date, "_", 
                            unlist(strsplit(choose$event, " "))[1], ".md"), 
              quote=FALSE, row.names=FALSE,
              col.names=FALSE, fileEncoding = "UTF8")
}



## Projects ----------------------------------------------------

d_talks <- googlesheets4::range_read(googlesheets4::as_sheets_id(id),
                          sheet="talks")

articles_animal <- articles %>%
  filter(grepl("applications_animal", project))
articles_plant <- articles %>%
  filter(grepl("applications_plant", project))
articles_human <- articles %>%
  filter(grepl("applications_human", project))
articles_integration <- articles %>%
  filter(grepl("integration", project))
articles_networks <- articles %>%
  filter(grepl("networks", project))
articles_rnaseq <- articles %>%
  filter(grepl("rnaseq", project))

packages_integration <- packages %>%
  filter(grepl("integration", project))
packages_networks <- packages %>%
  filter(grepl("networks", project))
packages_rnaseq <- packages %>%
  filter(grepl("rnaseq", project))

### applications ---------------------------------------------------

applications <- glue(
'+++
# Date this page was created.
date = "2020-07-22"

# Project title.
title = "Applications"

# Project summary to display on homepage.
summary = "Applications in human, animal, and plant genomics"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "applications_illustrate.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["applications"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
#[header]
#image = "headers/bubbles-wide.jpg"
# caption = "My caption :smile:"

+++

My research is strongly motivated by applications in human, animal, and plant
genomics. I have made strong efforts to contribute analyses and 
develop methods that can provide useful solutions in these areas.

<center>**Animal genomics applications**</center>

',
paste0(articles_animal$full2, collapse = "\n"),
'

<center>**Plant genomics applications**</center>

',
paste0(articles_plant$full2, collapse = "\n"),

'
<center>**Human genomics applications**</center>

',
paste0(articles_human$full2, collapse = "\n")
)

write.table(applications, 
            file = paste0("content/project/applications.md"), 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")

### integration -------------------------------------------------

integration <- glue(
'+++
# Date this page was created.
date = "2018-08-02"

# Project title.
title = "Multi-omic data integration"

# Project summary to display on homepage.
summary = "Methodological contributions to integrative multi-omic analyses"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "integrative_illustrate.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["integration"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
# [header]
# image = "headers/bubbles-wide.jpg"
# caption = "My caption :smile:"

+++

## Related software:

',
  paste0(packages_integration$fullb, collapse = "\n"),
'

<img src="../../img/hex_integrative.png" alt ="" />


## Related publications:

',
paste0(articles_integration$full2, collapse = "\n")
)

write.table(integration, 
            file = paste0("content/project/integration.md"), 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")

### networks -------------------------------------------------

networks <- glue(
'+++
# Date this page was created.
date = "2018-05-02"

# Project title.
title = "Network inference"

# Project summary to display on homepage.
summary = "Identify gene regulatory networks from transcriptomic data"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "networks_example.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["networks"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
#[header]
#image = "headers/bubbles-wide.jpg"
# caption = "My caption :smile:"

+++

## Related software:

',
  paste0(packages_networks$fullb, collapse = "\n"),
'

## Related publications:

',
  paste0(articles_networks$full2, collapse = "\n")
)

write.table(networks, 
            file = paste0("content/project/networks.md"), 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")

### rnaseq ---------------------------------------------------
  

rnaseq <- glue(
'+++
# Date this page was created.
date = "2018-08-02"

# Project title.
title = "RNA-seq co-expression"

# Project summary to display on homepage.
summary = "Identify and visualize clusters of co-expressed genes from RNA-seq data"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "coseq_hex.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["rnaseq"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
#[header]
#image = "headers/bubbles-wide.jpg"
# caption = "My caption :smile:"

+++
## Related software:

',
  paste0(packages_rnaseq$fullb, collapse = "\n"),
  '

## Related publications:

',
  paste0(articles_rnaseq$full2, collapse = "\n")
)

write.table(rnaseq, 
            file = paste0("content/project/rnaseq.md"), 
            quote=FALSE, row.names=FALSE,
            col.names=FALSE, fileEncoding = "UTF8")


## Build website ---------------------------------------------------

# build_site()
# serve_site()

# Building sites â€¦ WARN 2021/04/26 17:57:51 Page's .Hugo is deprecated and will be removed in a future release. Use the global hugo function.
# WARN 2021/04/26 17:57:51 Page's .RSSLink is deprecated and will be removed in a future release. Use the Output Format's link, e.g. something like: 
#     {{ with .OutputFormats.Get "RSS" }}{{ .RelPermalink }}{{ end }}.
# WARN 2021/04/26 17:57:51 Page's .URL is deprecated and will be removed in a future release. Use .Permalink or .RelPermalink. If what you want is the front matter URL value, use .Params.url.
