#---------------------------------------------------------------------------------------------------
@positive
Feature: Karate GET Example
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
Scenario: Get Product Reviews
#---------------------------------------------------------------------------------------------------

  * def productId = 4

  Given url `${baseUrl}/rest/products/${productId}/reviews`
  When method GET
  Then status 200
  And match response.status == "success"
  And match response.data == "#[1]"
  And match response.data[0].product == productId
  And match response.data[0].author == "admin@juice-sh.op"
  And match response.data[0].liked == true
