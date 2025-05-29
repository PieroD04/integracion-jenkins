Feature: Authentication

  Scenario Outline: Successful login
    Given the service is available
    When the client sends username "<username>" and password "<password>"
    Then the response should have status code 200
    And the body should contain "token"

    Examples:
      | username | password |
      | admin    | 1234     |
      | usuario  | 1234     |


  Scenario: Failed login with invalid credentials
    Given the service is available
    When the client sends username "invalid_user" and password "wrong_password"
    Then the response should have status code 401
    And the response body should contain key "detail"
    And the response body's "detail" should be "Credenciales incorrectas"