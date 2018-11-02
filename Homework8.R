rm(list=ls())
setwd("~/Desktop/intro-biocomp/class/Biocomp-Fall2018-181026-Exercise8")
df <- read.table("UWvMSU_1-22-13.txt", header = T)

#------------------------Q1------------------------
# GOAL: write for loop that adds previous score to running total

# seperate just MSU data
msu <- df[df$team == "MSU",]
# create a null vector
msu$total <- rep(0, length(msu$score))
# initial condition for the for loop
msu$total[1] <- msu$score[1]
# for loop sequentially adding score to a new column called total
for(i in 2:length(msu$score)){
  msu$total[i] <- msu$score[i] + msu$total[i-1]
}
# make sure that they equal eachother 
sum(msu$score) == tail(msu$total, n = 1)

# repeat above for team 2
uw <- df[df$team == "UW",]
uw$total <- rep(0, length(uw$score))
uw$total[1] <- uw$score[1]
for(i in 2:length(uw$score)){
  uw$total[i] <- uw$score[i] + uw$total[i-1]
}
sum(uw$score) == tail(uw$total, n = 1)

# graph!
plot(total ~ time, data=uw, type='l', col = 'red')
lines(total ~ time, data=msu, col = 'blue')

#------------------------Q2------------------------
# GOAL: Write a function that simulates a guessing game
rm(list=ls())

# allows user input for the game and prints out warning if the number guessed is not
# between 1 and 100.
game <- function(){ 
  n <- readline(prompt="Think of a number between 1 and 100: ")
  n <- as.numeric(n)
  if((as.numeric(n) > 0) & (as.numeric(n) <= 100)){
    return(as.numeric(n))
  }
  else{
    cat("Warning: number must be between 1 and 100")
    return(game())
  }
}

# fucntion to play the guessing game. To play: run random num generator and then enter
# "play()" into the console

play <- function(){
  guess <- -100
  while(guess != num){ 
  guess <- game()
  
  if (guess == num)
  {
    cat("Woohoo! You Win! ", num, "is Correct!\n")
  }
  else if (guess < num)
  {
    cat("HIGHER!! \n")
  }
  else if(guess > num)
  {
    cat("Easy there, try going lower! \n")
  }
  }
}

# run this code to play!
num <- round(runif(1)*100)
play()











