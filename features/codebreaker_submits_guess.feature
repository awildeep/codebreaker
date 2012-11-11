Feature: code-breaker submits guess
  The code breaker submits a guess of four numbers. The game marks the guess with + and - signs.
  For each number in the guess that matches the number and position of a number in the secret code.
  The mark inludes one + sign.
  For each number in the guess that matches the number but not the position of a number in the 
  secret code the mark includes one - sign.

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

    Examples: 
      #no matches
    	| code | guess | mark | 
    	| 1234 | 5555  |      | 
      #one match
    	| 1234 | 1555  | +    | 
    	| 1234 | 2555  | -    | 
      #Two matches
    	| 1234 | 5254  | ++   | 
    	| 1234 | 5154  | +-   | 
    	| 1234 | 2545  | --   | 
      #Three matches
      | 1234 | 5234  | +++  | 
      | 1234 | 5134  | ++-  | 
      | 1234 | 5124  | +--  | 
      | 1234 | 5123  | ---  | 
      #Four matches
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |


