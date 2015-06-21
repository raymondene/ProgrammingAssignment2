## The following functions can compute and cache the inverse of a matrix

## creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
          m<-NULL
          set<-function(y){
                    x<<-y
                    m<<-NULL
            }
              get<-function() x
              setmatrix<-function(solve) m<<- solve
              getmatrix<-function() m
              list(set=set, get=get,
                        setmatrix=setmatrix,
                              getmatrix=getmatrix)
    }


## computes the inverse of the "matrix" returned by makeCacheMatrix(). 
## If the inverse has already been calculated and the matrix has not changed, 
## it'll retrieves the inverse from the cache directly

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                    m<-x$getmatrix()
                    if(!is.null(m)){
                            message("getting cached data")
                            return(m)
                  }
                      matrix<-x$get()
                      m<-solve(matrix, ...)
                      x$setmatrix(m)
                      m
        }
