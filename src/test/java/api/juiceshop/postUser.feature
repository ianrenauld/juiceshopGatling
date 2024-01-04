#---------------------------------------------------------------------------------------------------
@positive
Feature: Karate POST Example
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
Scenario: Create New User
#---------------------------------------------------------------------------------------------------

  * def email = "testo@example.com"
  * def password = "Pass123!"

  Given url `${baseUrl}/api/Users`
  And request
    """
    {
      "email":          "#(email)",
      "password":       "#(pasword)",
      "passwordRepeat": "#(password)",
      "securityQuestion": {
        "id":        2,
        "question":  "Mother's maiden name?",
        "createdAt": "2023-12-09T12:00:00.000Z",
        "updatedAt": "2023-12-09T12:00:00.000Z",
      },
      "securityAnswer": "ImNotShowingYou!"
    }
    """
  When method POST
  Then status 201
  And match response.status == "success"
  And match response.data.role == "customer"
  And match response.data.id == "#number"
  And match response.data.isActive == true
  And match response.data.email == email
  And match response.data.username == ""
