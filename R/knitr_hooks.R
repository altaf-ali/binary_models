library(knitr)

hook_output = knit_hooks$get('output')
knit_hooks$set(output = function(x, options) {
  if (!is.null(n <- options$out.lines)) {
    if(length(n)==1) n<-c(n,n)
    x = unlist(stringr::str_split(x, '\n'))
    len <- length(x)
    if (length(x) > n[1]) {
      # truncate the output
      x = x[intersect(seq_along(x), n)]
      if(n[1] >1) x = c('....\n', x)
      if(range(n)[2] < len) x = c(x, '....\n')
    }
    x = paste(x, collapse = '\n') # paste first n lines together
  }
  hook_output(x, options)
})

