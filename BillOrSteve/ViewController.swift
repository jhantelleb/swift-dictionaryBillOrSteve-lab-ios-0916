//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Dictionary for Bill and Steve facts
    var billSteveFacts: [String: [String]] = [:]
    var chosenRandomPerson = ""
    var currentFact = ""
    var chosenPerson = ""
    var score = 0
    var indexFact = 0
    var nameIndex = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    @IBAction func billButton(sender: AnyObject) {
      if chosenRandomPerson == "Bill Gates" &&
         score < 9 {
         score += 1
         scoreLabel.text = String(score)
        
        //For the next round
        removeFact(chosenRandomPerson)
     if billSteveFacts.count > 1{
            chosenRandomPerson = randomPerson()}
        showFact()
      }
        if score == 9{
        factLabel.text = "That was great! Thanks for playing!"
        }else{
        showFact()
      }
    }

    @IBAction func steveButton(sender: AnyObject) {
        if chosenRandomPerson == "Steve Jobs" &&
           score < 9 {
            score += 1
            scoreLabel.text = String(score)
            
            //For next round
            removeFact(chosenRandomPerson)
            if billSteveFacts.count > 1{
                chosenRandomPerson = randomPerson()}
            showFact()
        }
           if score == 9{
            factLabel.text = "That was great! Thanks for playing!"
           }else{
            showFact()
     }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        chosenRandomPerson = randomPerson()
        showFact()
        
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = Int(arc4random_uniform(2))
        nameIndex = randomNumber
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    
    func getRandomFact() -> (fact: String, getPerson: String)?{
        
        var stringFacts = ""
        
        if !billSteveFacts.isEmpty {
        let factCount = billSteveFacts[chosenRandomPerson]!.count
        if factCount != 1{
            indexFact = randomNumberFromZeroTo(factCount)}
        else{
            indexFact = 0
            }}
        if let facts = billSteveFacts[chosenRandomPerson]{
           if billSteveFacts[chosenRandomPerson]!.count != 0 {
            stringFacts = facts[indexFact]}
            }
            return(stringFacts, chosenRandomPerson)
    }


    func createFacts(){
            billSteveFacts["Bill Gates"] =
                ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                 "He scored 1590 (out of 1600) on his SATs.",
                 "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                 "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                 "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
            billSteveFacts["Steve Jobs"] =
                ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                 "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                 "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                 "He was a pescetarian, meaning he ate no meat except for fish."]
    }

    func showFact(){
        
        let randomFact = getRandomFact()
        if let randomFact = randomFact{
           currentFact = randomFact.fact
           factLabel.text = randomFact.fact
           chosenRandomPerson = randomFact.getPerson
            
        }
    }
    
    func removeFact(name: String){
        
        if var facts = billSteveFacts[name] {
           print(facts)
           if facts.count > 1{
               facts.removeAtIndex(indexFact)
               billSteveFacts[name] = facts}
           else if facts.count == 1{ //remove name if no facts are left
             billSteveFacts.removeValueForKey(name)
             switch nameIndex{
              case 0: //Change to Bill Gates
                chosenRandomPerson = "Bill Gates"
              default:
                chosenRandomPerson = "Steve Jobs"
            }}
        }
        //. .removeAtIndex(indexFact)
    }
    }