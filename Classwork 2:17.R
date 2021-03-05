library(tidyverse)

#1
x<- list(26,32,45,50,65,77,82)
y<- list(30,43,50,58,62,71,88)

#1a
map2_dbl(x,y, ~ .x + .y) 
map2_dbl(x,y,  `+`)

#1b
map2_dbl(x,y, ~.x^2 - sqrt(.y))

#1c
map2_dbl(x,y, ~log(.x) / log(.y))

#2

x<- list(2,4,5,9,1)
y<- list(8,7,2,8,3)
z<- list(1,8,5,4,2)



pmap_dbl(list(x,y,z), function(first, second, third) (first + second + third)^2)

#3
tribble( ~Student,  ~Gender,    ~Salary,
         "John",   "Male",       65000,
         "Alice",  "Female",    73000,
         "Juan",   "Male",       66000,
         "Beth",  "Female",    71500,
         "Denise", "Female",  82000
) -> table
table

table %>% 
  pmap_chr(~ str_glue(" {..1} who is {..2}, has a salary that is {..3} per year."))

#4
qq <- matrix( nrow = 5, ncol = 5)
for (m in 1:5) {
  for (n in 1:5) {
    qq[m, n] <- (m + n)
  }
}
print(qq)
