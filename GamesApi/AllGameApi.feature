Feature:
Games API for creating, deleting and listing the books

Scenario:
    Get one game scenario
    Given url 'http://127.0.0.1:80//api/v1/resources/games'
    Given param id = 0
    When method get
    Then status 200
    And print response
    And match response == "#[]"
    And match response == "#[1]"

Scenario:
    Get all the books
    Given url 'http://127.0.0.1:80//api/v1/resources/games/all'
    When method get
    #
    #verify response is good
    Then status 200
    #
    #print response on console
    And print response
    #
    #verify, assert, match reponse to make sure it is in an array
    And match response == "#[]"
    #
    #verify that the array contains 5 values
    #if you try to assert any other value besides 5 in an array then it should fail the test
    And match response == "#[5]"
    #
    #verify that id of the item in the array should be 0
    And match response[0].id == 0
    #
    #verify that all(*=all) of the ids in the response are ither 0,1,2,3,4 and nothing else
    #if you put a value for id any other then the ids of your items, then test should fail
    #ie [1,2,6,3,4] this will fail because there are no games with id =6
    And match response[*].id contains [1,2,3,4]
    #
    #the following checks each item in the array verifies that the
    #console is present, that the id is of number datatype and title is of string datatype
    #note "s" in string is in lowercase, also if you do == instead of contains in the following then
    #it will want to match each reponse exactly as is, meaning it will expect you to check all of the items
    #in the array and not just some of them like we are doing here
    #here we are checking the console, id, and title and not checking the description or the year.
    #but if we did == then it will expect us to check those to fields also.
    And match each response contains {console:"#present", id:"#number", title:"#string"}

Scenario:
    Post a game
    Given url 'http://127.0.0.1:80/api/v1/resources/games'
    #And request '{"console": "testConsole", "description": "testDescription", "id": 5, "title": "testTitle", "year": "2023"}'
    And request read('game.json')
    And header Content-Type = 'application/json'
    When method post
    Then status 200

Scenario:
    Delete a game
    Given url 'http://127.0.0.1:80/api/v1/resources/games'
    And param id = 5
    When method delete
    Then status 200