## Put comments here that give an overall description of what your
## functions do

  ## These two functions work together to cache a matrix and its inverse
  ## so that the inverse only needs to be calculated once.

## This function creates a special "matrix" object that can cache 
## its inverse

## Write a short comment describing this function

  ## Cache the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    print(setsolve)
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

## Write a short comment describing this function

  ## cacheSolve function computes the inverse of the special "matrix" returned 
  ## by makeCacheMatrix above. If the inverse has already been 
  ## calculated (and the matrix has not changed), then cacheSolve should
  ## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  print("called with x=")
  print(x)
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
