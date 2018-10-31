+++
date = 2017-01-01T00:00:00  # Schedule page publish date.

title = "Co-expression analyses of RNA-seq data in practice with the R/Bioconductor package coseq"
time_start = 2018-06-22T16:15:00
time_end = 2018-06-22T17:00:00
abstract = ""
abstract_short = ""
event = "Mixture models: Theory and applications workshop"
event_url = "https://indico.math.cnrs.fr/event/2895"
location = "Paris, France"

# Is this a selected talk? (true/false)
selected = false

# Projects (optional).
#   Associate this talk with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
projects = ["rnaseq"]
tags = ["rnaseq"]

# Links (optional).
url_pdf = ""
url_slides = ""
url_video = ""
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

In this talk, I will present some of the features of the R/Bioconductor package coseq, which provides a
straightforward wrapper to identify groups of co-expressed genes from RNA sequencing data using
Poisson mixture models (Rau et al., 2015), Gaussian mixture models (Rau et al., 2017), or the Kmeans
algorithm (Godichon-Baggioni et al., 2018) in conjunction with appropriately chosen data
transformations. In particular, I will focus on our efforts to facilitate use of coseq within standard
RNA-seq analysis pipelines. I will also highlight some successful recent biological applications of
coseq at INRA in a variety of organisms, including the chicken (Endale Ahanda et al., 2014), tomato
(Sauvage et al., 2017), and a parasite of the honeybee (Mondet et al., 2018). Finally, I will briefly
discuss some of our recent efforts to integratively make use of multiple data views (i.e., biological
levels of molecular information) to identify biologically relevant and interpretable clusters from
multi-omics data.