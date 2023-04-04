Feature:

Scenario:
    Post a game
    Given url 'http://127.0.0.1:80/api/v1/resources/games'
    #And request '{"console": "testConsole", "description": "testDescription", "id": 5, "title": "testTitle", "year": "2023"}'
    And request read('game.json')
    And header Content-Type = 'application/json'
    When method post
    Then status 200