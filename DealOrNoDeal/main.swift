//
//  main.swift
//  DealOrNoDeal
//
//  Created by Gordon, Russell on 2020-02-04.
//  Copyright © 2020 Gordon, Russell. All rights reserved.
//

import Foundation

//
// INPUT SECTION OF PROGRAM
//
var briefcasesOpened = -1
var briefcaseOpenedThisTime = 0
var totalBriefCaseValue = 0

// Loop until valid input provided by user
while true {
    
    // Ask for input
    print("How many briefcases have been opened?")
    guard let inputGiven = readLine() else {
        
        // No input given, return to top of loop and ask again
        continue
    }
    
    // Attempt to make input into an integer
    guard let integerGiven = Int(inputGiven) else {
        
        // Could not make input into an integer, so return to top and ask again
        continue
        
    }
    
    // Check that integer is in desired range
    // REMEMBER: Guard statement conditions describe what we WANT
    guard integerGiven > 0, integerGiven < 11 else {
        
        // Integer not in desired range, return to top and ask again
        continue
        
    }
    
    // If we've made it here, the input is valid
    briefcasesOpened = integerGiven
    
    // Stop looping
    break
    
}


// PROCESS SECTION OF PROGRAM


// Create the array with briefcase values
var briefcaseValues = [100, 500, 1_000, 5_000, 10_000, 25_000, 50_000, 100_000, 500_000, 1_000_000]


// PURPOSE: Asks the user for a briefcase that is opened during a turn, as shown in the example
func getBriefcaseOpened(onTurn turn: Int) -> Int {
    
    // When the input is invalid, the prompt is repeated.
    while true {
        print("Which briefcase did you open?")

        // INPUT / PARAMETERS: What turn it is
        guard let inputGivenStr = readLine() else {
            
            // No input given, return to top of loop and ask again
            continue
        }
        
        // Attempt to make input into an integer
        guard let inputGivenInt = Int(inputGivenStr) else {
            
            // Could not make input into an integer, so return to top and ask again
            continue
            
        }
        
        // Check that integer is in desired range
        // REMEMBER: Guard statement conditions describe what we WANT
        guard inputGivenInt > 0, inputGivenInt < 11 else {
            
            // Integer not in desired range, return to top and ask again
            continue
            
        }
        
        // If we've made it here, the input is valid
        briefcaseOpenedThisTime = inputGivenInt
        
        // OUTPUT / RETURN VALUE: An integer between 1 and 10, inclusive
        // The statement below can be modified
        return briefcaseOpenedThisTime
        
    }
}

// Loop and ask what briefcases have been opened
for turn in 1...briefcasesOpened {
    
    // Get which briefcase was opened
    let briefcaseOpenedThisTime = getBriefcaseOpened(onTurn: turn)
    
    // STUDENTS: Now that you know what briefcase is opened... what might you do to the array value(s)?
    briefcaseValues[briefcaseOpenedThisTime - 1] = 0
    
}


// Ask user how much the banker offered them
func bankersOffer() -> Int {
    
    // STUDENTS: Complete this function
    while true {
        // Ask what the offer is
        print("What was the banker's offer?")
        
        guard let offerStr = readLine() else {
            
            // No input given, return to top of loop and ask again
            continue
        }
        
        // Attempt to make input into an integer
        guard let offerInt = Int(offerStr) else {
            
            // Could not make input into an integer, so return to top and ask again
            continue
            
        }
        
        // Check that integer is in desired range
        // REMEMBER: Guard statement conditions describe what we WANT
        guard offerInt > 0 else {
            
            // Integer not in desired range, return to top and ask again
            continue
            
        }
        
        // The statement below can be modified
        return offerInt
        
    }
    
}



// STUDENTS: Do any remaining calculations you might need below.

for briefcase in briefcaseValues {
    totalBriefCaseValue += briefcase
}

var averageBriefcaseValue = totalBriefCaseValue/(briefcaseValues.count - briefcasesOpened)


// OUTPUT SECTION OF PROGRAM
//

// STUDENTS: Now tell the player whether to take the deal, or not.
if bankersOffer() > averageBriefcaseValue {
    print ("Deal")
} else {
    print ("No deal")
}
