+++
title = " Identification of marginal causal relationships in gene networks from observational and interventional expression data"
date = "2017-03-16"

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Monneret, G.", "Jaffr&eacute;zic, F.", "**Rau, A.**", "Zerjal, T.", "Nuel, G."]

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
publication = "*PLoS One*, 12(3): e0171142"
#publication_short = "In *PLoS One*"

# Abstract and optional shortened version.
abstract = "Causal network inference is an important methodological challenge in biology as well as other areas of application. Although several causal network inference methods have been proposed in recent years, they are typically applicable for only a small number of genes, due to the large number of parameters to be estimated and the limited number of biological replicates available. In this work, we consider the specific case of transcriptomic studies made up of both observational and interventional data in which a single gene of biological interest is knocked out. We focus on a marginal causal estimation approach, based on the framework of Gaussian directed acyclic graphs, to infer causal relationships between the knocked-out gene and a large set of other genes. In a simulation study, we found that our proposed method accurately differentiates between downstream causal relationships and those that are upstream or simply associative. It also enables an estimation of the total causal effects between the gene of interest and the remaining genes. Our method performed very similarly to a classical differential analysis for experiments with a relatively large number of biological replicates, but has the advantage of providing a formal causal interpretation. Our proposed marginal causal approach is computationally efficient and may be applied to several thousands of genes simultaneously. In addition, it may help highlight subsets of genes of interest for a more thorough subsequent causal network inference. The method is implemented in an R package called MarginalCausality (available on GitHub)."
abstract_short = ""


# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
selected = false

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
projects = ["networks"]

# Links (optional).
url_pdf = "http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0171142"
url_preprint = ""
url_code = "https://github.com/Monneret/MarginalCausality"
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

