rankall <- function(outcome, num = "best") {
        
        #Read outcome data
        
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")  
        
        # Check that outcome is valid
        
        valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
        valid_outcomes
        
        if (!outcome %in% valid_outcomes) stop ('Invalid outcome')
        
        ##Associate column names with column numbers
        outcome_column_numbers <- c (11, 17, 23)
        names(outcome_column_numbers) <- valid_outcomes
        
        col_num <- outcome_column_numbers[outcome]
        
        ## Make sure outcome data is trated as numeric
        df[, col_num] <- suppressWarnings(as.numeric(df[,col_num]))
        
        
        ## Get the list of states and fill the appropriate hospital names with NA
        state <- sort(unique(df$State))
        hospital <- rep(NA, length(state))
        
        ## Parameter (num)
        if (num == 'best') {
                n = 1
        } else {
                n <- num
        } 
        
        ## For each state, find the hospital of the given rank
        
        i <- 1
        for (s in state) {
                h_list <- subset(df, df$State == s, c(col_num, Hospital.Name))
                h_list <- h_list[order(h_list[,1], h_list[,2], na.last = NA), ]
           
                if (num == 'worst') {
                        n <- nrow(h_list)
                }
                if (!n %in% 1:nrow(h_list)) {
                        hospital[i] <- 'NA';
                }
                else {
                        hospital[i] <- h_list[n,2]
                }
                i <- i +1
        }
        
        
        
        # Return the dara
        return(data.frame(hospital, state))
        
}

head(rankall("heart attack", 20), 10)
