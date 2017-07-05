cacheSolve <- function(x, ...) {
      #This code will create an inverse of a matrix. 
      #To run this code issue the command cacheinverse(makeVectorForInverse(x))
       #Here x is a matrix
    
        #get value stored in 
        #the cache 
        m <- x$getinverse()
        #check if the value stored in cache "exists" and is not a null
        if(!is.null(m)) {
                #if the value in the cache does exist,
                #that is your answer
                message("getting cached data")
                #return that value and quit this function
                return(m)
        }
        #otherwise, get the data stored in "special vector"
        data <- x$get()
        #solve() gives matrix inverse
        m <- solve(data)
        #send the inverse to cache and store for future
        x$setinverse(m)
        #return the newly calculated inverse
        m
}


makeCacheMatrix <- function(x = numeric()) {
        #This function creates "special matrix for matrix inversion"
        m <- NULL
        #This is a function to set the value
        #<<- means that the value in the parent environment will be changed 
        set <- function(y) {
                x <<- y

                m <<- NULL
        }
        #this will just return the value of x from the enviornemnt 
        get <- function() x
        #sets the inverse
        setinverse <- function(inverse) m <<- inverse
        #gets the inverse
        getinverse <- function() m
        #this is basically a list of objects that will be accessed 
        #from the function cacheinverse() 
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}
