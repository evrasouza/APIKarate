Feature: Metodo POST para cadastrar usuarios

  Background:
    * url 'https://serverest.dev'

  @smoke
  Scenario: Cadastrar usuario com sucesso com body no corpo do teste

    * def body =
    """
    {
      "nome": "Adrian Smith",
      "email": "adrian@smith.com.br",
      "password": "teste",
      "administrador": "true"
    }
    """
    Given path '/usuarios'
    And request body
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'