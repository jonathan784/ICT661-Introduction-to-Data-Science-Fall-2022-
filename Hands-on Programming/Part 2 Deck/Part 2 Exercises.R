#JOnathan Part 2 Hands-on

#EXERCISE 5.2 (Vector of Cards)
hand <- c("ace", "king", "queen", "jack", "ten")
hand

typeof(hand)

#Exercise 5.3 (Make a Matrix)
hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", 
           "spades", "spades", "spades")

matrix(hand1, nrow = 5)
matrix(hand1, ncol = 2)
dim(hand1) <- c(5, 2)

#Exercise 5.4 (Write a Card)
#Make a virtual playing card by combining “ace,” “heart,” and 1 into a vector. What type of atomic vector will result? Check if you are right.
card <- c("ace", "hearts", 1)
card

#Exercise 5.5 (Use a List to Make a Card)
card <- list("ace", "hearts", 1)
card

#Exercise 6.1 (Deal a Card)/
deal <- function(cards) {
  cards[1, ]
}

#Exercise 6.2 (Shuffle a Deck)
shuffle <- function(cards) { 
  random <- sample(1:52, size = 52)
  cards[random, ]
}


cards2 <- shuffle(cards)

deal(cards2)

cards3 <- cards

#Exercise 7.1 (How many Aces?)
cards3$face
cards3$face == "ace"
sum(cards3$face == "ace")
cards3$value[cards3$face == "ace"]
cards3$value[cards3$face == "ace"] <- 14

#Exercise 7.2 (Score the Deck for Hearts)

cards4 <- cards
cards4$value <- 0
cards4$suit == "hearts"
cards4$value[cards4$suit == "hearts"] <- 1
queenOfSpades <- cards4$face == "queen" & cards4$suit == "spades"
cards4$value[queenOfSpades] <- 13

#Exercise 7.3 (Practice with Tests)
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")

#solutions
w > 0
10 < x & x < 20
y == "Febuary"
all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
             "Saturday", "Sunday"))
cards5 <- cards
head(cards5, 13)
facecard <- cards5$face %in% c("king", "queen", "jack")
cards5$value[facecard] <- 10

cards5$value[cards5$face == "ace"] <- NA

#Exercise 8.1 (Will deal work?)
deal <- function() {
  cards[ 1 , ]
}
deal()

#Exercise 8.3 (Rewrite shuffle)
shuffle <- function(){
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}

#Separate Run time environment
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle



