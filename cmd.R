## args
args <- commandArgs(TRUE)
result <- NA
if (length(args)>0) {
    result <- eval(parse(text=args[1]))
}
print(result)

fileConn<-file("out")
writeLines(paste("",result), fileConn)
close(fileConn)
