# Probe Nasa Challenge

Rest API status codes

|   Cod   |   Status                  |                             Details                                   |
|:-------:|:-------------------------:|:---------------------------------------------------------------------:|
|   200   |   OK                      |  means that your request and params is right to execute the program   |
|   400   |   Bad Request             |  means that you did something wrong follow the "message" to fix it    |
|   404   |   Not Found               |  means the url that you're trying to request does not exist           |
|   500   |   Internal Server Error   |  means the server is not ok, wait some minutes or call the developers |

### Home

Initial

```
    POST: localhost:3000/api/v1/
    cache-control: no-cache
```

Params

```
    No need params
```

Return Success Example

```
    {
        "cod": 200,
        "status": "OK",
        "message": {
            "welcome": "Bem vindo ao jogo da Sonda Exploradora da NASA",
            "hint": "Use apenas metodos POST nas rotas",
            "routes": {
                "/api/v1/": "Página principal, que exibe as boas vindas ao jogo",
                "/api/v1/instructions": "Exibe as instruções do jogo",
                "/api/v1/probe/moviments": "Aqui o jogo começa, e você pode movimentar sua sonda",
                "/api/v1/probe/reset": "Reseta a posição da sua sonda",
                "/api/v1/probe/position": "Exibe em qual posição sua sonda está"
            }
        }
    }
```

Instruction

```
    POST: localhost:3000/api/v1/instructions
    cache-control: no-cache
```

Params

```
    No need params
```

Return Success Example

```
    {
        "cod": 200,
        "status": "OK",
        "message": {
            "directions": {
                "E": "Esquerda",
                "D": "Direita",
                "C": "Cima",
                "B": "Baixo"
            },
            "moviments": {
                "M": "mover na direção que está apontado",
                "GE": "girar 90 graus à esquerda",
                "GD": "girar 90 graus à direta"
            },
            "param_example": {
                "key": "movimentos",
                "value": "GE, M, M, M, GD, M, M"
            },
            "hint": "recomendamos usar os parametros no body do método POST"
        }
    }
```

Not Found

```
    POST: localhost:3000/api/v1/any_not_found_page
                        or
    POST: localhost:3000/any_not_found_page
    cache-control: no-cache
```

Params

```
    No need params
```

Return Success Example

```
    {
        "cod": 404,
        "status": "not_found",
        "message": {
            "error": "Essa rota não existe, cheque nossa lista de rotas abaixo",
            "hint": "Use apenas metodos POST nas rotas",
            "routes": {
                "/api/v1/": "Página principal, que exibe as boas vindas ao jogo",
                "/api/v1/instructions": "Exibe as instruções do jogo",
                "/api/v1/probe/moviments": "Aqui o jogo começa, e você pode movimentar sua sonda",
                "/api/v1/probe/reset": "Reseta a posição da sua sonda",
                "/api/v1/probe/position": "Exibe em qual posição sua sonda está"
            }
        }
    }
```

### Probe


Moviments

```
    POST: localhost:3000/api/v1/probe/moviments
    cache-control: no-cache
```

Params

|    Param     |               Example           |
|:------------:|:-------------------------------:|
|    moviments |       GE, M, M, M, GD, M, M     |

Return Success Example

```
    {
        "cod": 200,
        "status": "OK",
        "message": "Sonda movida com sucesso"
    }
```

Return Error Example

```
    {
        "cod": 400,
        "status": "Bad Request",
        "message": "Insira parametros válidos"
    }
```

Reset

```
    POST: localhost:3000/api/v1/probe/reset
    cache-control: no-cache
```

Params

```
    No need params
```

Return Success Example

```
    {
        "cod": 200,
        "status": "OK",
        "message": "A sonda foi resetada com sucesso"
    }
```


Position

```
    POST: localhost:3000/api/v1/probe/position
    cache-control: no-cache
```

Params

```
    No need params
```

Return Success Example

```
    {
        "cod": 200,
        "status": "OK",
        "message": {
            "sua posição atual é": {
                "x": 0,
                "y": 0
            }
        }
    }
```

