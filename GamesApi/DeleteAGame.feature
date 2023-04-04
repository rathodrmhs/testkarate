Feature:

Scenario:
    Delete a game
    Given url 'http://127.0.0.1:80/api/v1/resources/games'
    And param id = 6
    When method delete
    Then status 200