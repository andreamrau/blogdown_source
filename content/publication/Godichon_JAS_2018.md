+++
title = "Clustering transformed compositional data using K-means, with applications in gene expression and bicycle sharing system data"
date = "2018-04-01"

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Godichon-Baggioni, A.", "Maugis-Rabusseau, C.", "**Rau, A.**"]

# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference proceedings
# 2 = Journal
# 3 = Work in progress
# 4 = Technical report
# 5 = Book
# 6 = Book chapter
publication_types = ["2"]

# Publication name and optional abbreviated version.
publication = "*Journal of Applied Statistics*, https://doi.org/10.1080/02664763.2018.1454894"
#publication_short = "In *JAS*"

# Abstract and optional shortened version.
abstract = "Although there is no shortage of clustering algorithms proposed in the literature, the question of the most relevant strategy for clustering compositional data (i.e. data whose rows belong to the simplex) remains largely unexplored in cases where the observed value is equal or close to zero for one or more samples. This work is motivated by the analysis of two applications, both focused on the categorization of compositional profiles: (1) identifying groups of co-expressed genes from high-throughput RNA sequencing data, in which a given gene may be completely silent in one or more experimental conditions; and (2) finding patterns in the usage of stations over the course of one week in the Velib' bicycle sharing system in Paris, France. For both of these applications, we make use of appropriately chosen data transformations, including the Centered Log Ratio and a novel extension called the Log Centered Log Ratio, in conjunction with the K-means algorithm. We use a non-asymptotic penalized criterion, whose penalty is calibrated with the slope heuristics, to select the number of clusters. Finally, we illustrate the performance of this clustering strategy, which is implemented in the Bioconductor package coseq, on both the gene expression and bicycle sharing system data."


# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
selected = false

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
projects = ["rnaseq-coexpression"]

# Links (optional).
url_pdf = "https://www.tandfonline.com/doi/full/10.1080/02664763.2018.1454894"
url_preprint = "https://arxiv.org/abs/1704.06150"
url_code = "https://bioconductor.org/packages/release/bioc/html/coseq.html"
url_dataset = ""
url_project = ""
url_slides = ""
url_video = ""
url_poster = ""
url_source = ""

# Custom links (optional).
#   Uncomment line below to enable. For multiple links, use the form `[{...}, {...}, {...}]`.
# url_custom = [{name = "Code", url = "https://bioconductor.org/packages/release/bioc/html/coseq.html"}]

# Does the content use math formatting?
math = true

# Does the content use source code highlighting?
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

