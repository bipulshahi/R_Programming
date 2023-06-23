#Try catch

tryCatch(
  
  #specify a expression
  expr = {
    1 + 1
    print("Its fine")
  },
  
  #Specify the error message
  error = function(e){
    print('There was an error')
  },
  warning = function(w){
    print('There was an warning message')
  },
  finally = {
    print("finally Executed")
  }
)


check <- function(expression){
  
  withCallingHandlers(expression ,
            warning = function(w){
            message("warning:\n",w)
            },
            
            error = function(e){
              message('error:\n',e)
            },
            finally = {
              message("completed")
            }
            )
  
}

check({10/2})
check({10/0})
check({10/'noe'})



test_warning <- function(min,max){
  if (max < min){
    warning("Warning , warning . Max < Min")
  }
  if(max > min){
    message("Well , max > min")
  }
}

test_warning(10,20)

test_warning(20,10)

suppressWarnings(test_warning(10,20))
suppressWarnings(test_warning(20,10))


input_list <- list(1,2,3,'Hello',10,-20,2.6,0,1156)

for (val in input_list){
  print(paste("Power raised to 2",val,"is:",val**2))
}

#------------------TryCatch---------------------------------
tryCatch(
  
  #specify a expression
  expr = {
    for (val in input_list){
      print(paste("Power raised to 2",val,"is:",val**2))
    }
  },
  
  #Specify the error message
  error = function(e){
    print('There was an error')
  },
  warning = function(w){
    print('There was an warning message')
  },
  finally = {
    print("finally Executed")
  }
)

#-------------------------WithCallingHandlers-------------
check <- function(val){
  
  withCallingHandlers(print(paste("Power raised to 2",val,"is:",val**2)) ,
                      warning = function(w){
                        message("warning:\n",w)
                      },
                      
                      error = function(e){
                        message('error:\n',e)
                      },
                      finally = {
                        message("completed")
                      }
  )
  
}

input_list <- list(1,2,3,'Hello',10,-20,2.6,0,1156)

for (val in input_list){
  check(val)
}


#-------------Try() with silent

input_list <- list(1,2,3,'Hello',10,-20,2.6,0,1156)

for (val in input_list){
  try(print(paste("Power raised to 2",val,"is:",val**2)), silent = TRUE)
}

#-------------Try() without silent
for (val in input_list){
  try(print(paste("Power raised to 2",val,"is:",val**2)))
}



input_list <- list(1,2,3,'Hello',10,-20,2.6,0,1156)
TC_fun = function(x){
  tryCatch(x**2,
            warning = function(w) {print(paste("negative argument",x)) ;
              -inp**2},
            error = function(e) {print(paste("non-numeric argument", x));
              NaN})
}
for (val in input_list){
  print(paste("Try Catch function of", val , '=' , TC_fun(val)))
}

#WAP for error handling which can check error for a input value is numeric or not
power_calculation <- function(x , y){
  tryCatch(
    expr = {
      message(x**y)
      message("Successfully Calculated x to power of y")
    },
    error = function(e){
      message('Caught an Error!')
      print(e)
    },
    warning = function(w){
      message('Caught an Warning')
      print(w)
    },
    finally = {
      message('Program executed successfully')
    }
  )
}
power_calculation(10,2)
power_calculation('a',2)



get_numbers = function(a,b){
  if (!is.numeric(a)){
    warning("a must be a numeric")
  }
  if (!is.numeric(b)){
    warning("b must be a numeric")
  }
  power_calculation(a,b)
}

get_numbers(4,2)
get_numbers('a',2)
get_numbers(4,'b')

