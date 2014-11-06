
rodeo$methods(
  initialize = function(file) {
    "Initializes a \\code{rodeo} object with json-formatted data from \\code{file}"
    if (!is.character(file) || !(length(file) == 1) || !file.exists(file))
      stop("argument must be a valid file name")
    x= fromJSON(file=file)
    if ((!is.list(x)) || (!all(c("auxx", "proc","stox") %in% names(x))))
      stop("missing components in initialization data")
    m= matrix(rep("0", length(x$stox)*length(x$proc)), ncol=length(x$stox), nrow=length(x$proc))
    m= data.frame(m, stringsAsFactors=FALSE, row.names=names(x$proc))
    for (i in 1:length(x$stox)) {
      names(m)[i]= names(x$stox[i])
      for (k in 1:length(x$stox[[i]])) {
        if (!(names(x$stox[[i]][k]) %in% names(x$proc)))
          stop(paste("found stoichiometry factor for state variable '",names(x$stox[i]),
            "' referring to undefined process '",names(x$stox[[i]][k]),"'"))
        m[names(x$stox[[i]][k]), i]= x$stox[[i]][[k]]
      }
    }
    # Initialize all fields
    auxx <<- unlist(x$auxx)
    proc <<- unlist(x$proc)
    stox <<- m
    nam= names(m)
    vars <<- setNames(rep(NA, length(nam)), nam)
    funs <<- namesOfFuns(.self)
    nam= namesOfPars(.self)
    pars <<- setNames(rep(NA, length(nam)), nam)
    return(invisible(NULL))
  }
)
