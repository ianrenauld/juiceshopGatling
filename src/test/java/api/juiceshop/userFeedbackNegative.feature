#---------------------------------------------------------------------------------------------------
@negative
Feature: Karate Advanced Example
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
Scenario Outline: POST User feedback Negative Test - <case>
#---------------------------------------------------------------------------------------------------

  Given url `${baseUrl}/api/Feedbacks`
  And request
    """
    {
      "captchaId": 0,
      "captcha": <captchaAnswer>,
      "comment": "This comment will not get posted (anonymous)",
      "rating": 5
    }
    """
  When method POST
  Then status 401
  And match response == "Wrong answer to CAPTCHA. Please try again."

Examples:
  | captchaAnswer | case                               |
  | "!"           | Special Character                  |
  | "A"           | Letter                             |
  | "🙀"           | Unicode extended Character (emoji) |
  | true          | Boolean                            |
  | 99999         | Number data type                   |
  | "99999"       | Wrong mathematical answer          |
