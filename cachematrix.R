## These functions cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its reverse.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get, 
             setinv = setinv,
             getinv = getinv)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message('Getting cached data')
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinv(inv)
        inv
}

## Sample run:
##  x = matrix(1:4, 2,2)
##  m = makeCacheMatrix(x)
##  m$get()
##        [,1] [,2]
##  [1,]    1    3
##  [2,]    2    4
  
## No cache in the first run
##> cacheSolve(m)
##        [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5

## Retrieving from the cache in the second run
## > cacheSolve(m)
## Getting cached data
##        [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5  

