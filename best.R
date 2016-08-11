outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
head(outcome$Hospital.Name[outcome$State=='MA'])

outcome[, 11] <- as.numeric(outcome[,11])
hist(outcome[,11])


best <- function(state, outcome) {

        #Read outcome data
        
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")  
        
        # Check that state and outcome are valid
        valid_states <- unique(df$State)
        valid_states
        valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
        valid_outcomes
        
        if (!state %in% valid_states) stop('Invalid state')
        if (!outcome %in% valid_outcome) stop ('Invalid outcome')
        
        ##Associate column names with column numbers
        outcome_column_numbers <- c (11, 17, 23)
        names(outcome_column_numbers) <- valid_outcomes
        
        col_num <- outcome_column_numbers[outcome]
        
        ## Make sure outcome data is trated as numeric
        df[, col_num] <- suppressWarnings(as.numeric(df[,col_num]))
        
        ##Find the lowest mortality rate
        low_rate <- min(subset(df, State == state, col_num), na.rm = TRUE)
        
        best_hospitals <- subset(df, State == state & df[,col_num] == low_rate, Hospital.Name)
        
        
        ## Return the best hospital name sorted in alphabetical order if there is a tie
        #return(sort(best_hospitals$Hospital.Name)[1])
        
        return(best_hospitals)

}

best("TX", "heart failure")