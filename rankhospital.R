rankhospital <- function(state, outcome, num = "best") {
        
        #Read outcome data
        
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")  
        
        # Check that state and outcome are valid
        valid_states <- unique(df$State)
        valid_states
        valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
        valid_outcomes
        
        if (!state %in% valid_states) stop('Invalid state')
        if (!outcome %in% valid_outcomes) stop ('Invalid outcome')
        
        ##Associate column names with column numbers
        outcome_column_numbers <- c (11, 17, 23)
        names(outcome_column_numbers) <- valid_outcomes
        
        col_num <- outcome_column_numbers[outcome]
        
        ## Make sure outcome data is trated as numeric
        df[, col_num] <- suppressWarnings(as.numeric(df[,col_num]))
        
        ## Create a hospital list
        
        h_list <- subset(df, State == state, c(col_num, Hospital.Name))
        
        ## Sort list by rate (ASC), then by name (ASC)
        
        h_list <- h_list[order(h_list[,1], h_list[,2], na.last = NA), ]
        h_list
        
        ## Getting the best or worst case
        if (num == 'best')
                num = 1
        else if (num == 'worst')
                num = nrow(h_list)
        
        ## Return NA when num is not valid
        
        if (!num %in% 1:nrow(h_list))
                return(NA)
        else
                return(h_list[num, 2]) 
        

}

rankhospital("TX", "heart failure", 4)
