---
title: hello-world.Rmd
author: ~
date: '2018-02-22'
slug: hello-world-rmd
categories: []
tags: []
header:
  caption: ''
  image: ''
---

https://alison.rbind.io/post/up-and-running-with-blogdown/
https://tclavelle.github.io/blog/blogdown_github/

Also, I added .nojekyll to the project

blogdown::new_site(theme = "gcushen/hugo-academic", theme_example = TRUE)


blogdown::new_site(theme = "gcushen/hugo-academic", theme_example = TRUE)
# Create a new post
new_post(title = 'hello-world.Rmd')
build_site()
