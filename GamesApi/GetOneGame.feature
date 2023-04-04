Feature: Get one game scenario

Scenario:
Verify that repsonse is okay
    Given url 'http://127.0.0.1:80//api/v1/resources/games'
    Given param id = 0
    When method get
    Then status 200

Scenario:
Verify that response is an array
    Given url 'http://127.0.0.1:80//api/v1/resources/games'
    Given param id = 0
    When method get
    Then print response
    And match response == "#[]"

Scenario:
Verify reponse has returned 1 array element
        Given url 'http://127.0.0.1:80//api/v1/resources/games'
        Given param id = 0
        When method get
        Then match response == "#[1]"