cacheinverse <- function(x, ...) {
            #This code will create an inverse of a matrix. 
            #To run this code issue the command cacheinverse(makeVectorForInverse(x))
            #Here x is a matrix
            #You need to have makeVectorForInverse.R sourced prior to running this code
        m <- x$getinverse()

        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()

        m <- solve(data)
        x$setinverse(m)
        m
}

