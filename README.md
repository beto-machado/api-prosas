# Api Proposta

### Funcionalidadess:
- Cadastro para proposta, paginação da api com o valor padrão de 10 propostas por página, ordenar por nome (crescente), filtrar por nome, valor, inicio e fim.

### Lista de Propostas
```
GET /api/v1/propostas
```

```json
// response body, status: 200
 {
    "type": "propostas",
    "data": [
        {
            "id": "21560108-5e45-4794-a8ba-17c580a24add",
            "nome": "Wan Schulist",
            "descricao": "Enim nisi est. Aut quasi consectetur. Nisi perspiciatis dolore. Suscipit quas sit. Quaerat vero aut. Fugiat voluptatem architecto. Consequuntur libero impedit. Fugit aut eos. Aut dolores sit. Laudantium quos consequatur. Architecto rem alias. Nihil unde e.",
            "valor": 63.64,
            "inicio": "2022-02-28",
            "fim": "2022-02-28",
            "created_at": "2022-02-28T16:40:57.538Z",
            "updated_at": "2022-02-28T16:40:57.538Z"
        }
    ],
    "meta": {
        "current_page": 6,
        "next_page": null,
        "total_page": 6,
        "total_items_per_page": 1,
        "total_items": 51
    }
}
```

### Detalhes da Proposta
```
GET /api/v1/propostas/:id
```

```json
// response body, status: 200
{
    "type": "proposta",
    "data": {
        "id": "21560108-5e45-4794-a8ba-17c580a24add",
        "nome": "Wan Schulist",
        "descricao": "Enim nisi est. Aut quasi consectetur. Nisi perspiciatis dolore. Suscipit quas sit. Quaerat vero aut. Fugiat voluptatem architecto. Consequuntur libero impedit. Fugit aut eos. Aut dolores sit. Laudantium quos consequatur. Architecto rem alias. Nihil unde e.",
        "valor": 63.64,
        "inicio": "2022-02-28",
        "fim": "2022-02-28",
        "created_at": "2022-02-28T16:40:57.538Z",
        "updated_at": "2022-02-28T16:40:57.538Z"
    }
}
```

```json
// response body, status: 404
{
  "errors": ["Couldn't find Product with 'id'=22"]
}
```

### Criar uma Proposta
```
POST /api/v1/propostas
```

```json
// request body
{
    "nome": "La Casa",
    "descricao": "Animi accusamus ut. Sunt maxime voluptatum. Dolore incidunt sequi. Numquam minima veniam. Quasi et molestias. Repudiandae nihil aperiam. Aut iusto et. Mollitia quae et. Dolore odit consequatur. Ut quia qui. Ab amet illo. Voluptatibus nihil sit. Eveniet es.",
    "valor": 10.00,
    "inicio": "10/10/2010",
    "fim": "15/10/2010"
}
```

```json
// response body, status: 201
{
    "type": "proposta",
    "data": {
        "id": "8b1aefb3-ff33-4b32-8af5-a94f7b73bea8",
        "nome": "La Casa de papel",
        "descricao": "Animi accusamus ut. Sunt maxime voluptatum. Dolore incidunt sequi. Numquam minima veniam. Quasi et molestias. Repudiandae nihil aperiam. Aut iusto et. Mollitia quae et. Dolore odit consequatur. Ut quia qui. Ab amet illo. Voluptatibus nihil sit. Eveniet es.",
        "valor": 10.0,
        "inicio": "2010-10-10",
        "fim": "2010-10-15",
        "created_at": "2022-03-02T17:06:55.886Z",
        "updated_at": "2022-03-02T17:06:55.886Z"
    }
}
```

```json
// response body, status: 422
{
    "nome": [
        "has already been taken"
    ]
}
```

### Atualizar um Produto
```
PUT/PATCH /api/v1/propostas/:id
```

```json
// request body
{
    "nome": "Como ganhar dinherio"
}
```

```json
// response body, status: 201
{
    "type": "proposta",
    "data": {
        "nome": "Como ganhar dinherio",
        "id": "21560108-5e45-4794-a8ba-17c580a24add",
        "valor": 63.64,
        "descricao": "Enim nisi est. Aut quasi consectetur. Nisi perspiciatis dolore. Suscipit quas sit. Quaerat vero aut. Fugiat voluptatem architecto. Consequuntur libero impedit. Fugit aut eos. Aut dolores sit. Laudantium quos consequatur. Architecto rem alias. Nihil unde e.",
        "inicio": "2022-02-28",
        "fim": "2022-02-28",
        "created_at": "2022-02-28T16:40:57.538Z",
        "updated_at": "2022-03-02T17:08:22.785Z"
    }
}
```

```json
// response body, status: 422
{
    "nome": [
        "can't be blank"
    ]
}
```

### Deletar um Produto

```
DELETE /api/v1/propostas/:id
```

```json
// response body, status: 204
null
```

```json
// response body, status: 404
{
  "errors": ["Couldn't find Product with 'id'=22"]
}
```

## Rodando o projeto:

Requisitos:
  - Ruby 3.0.2
  - Rails 6.1.4
  - Postgresql

Comandos:

```bash
git clone https://github.com/beto-machado/api-prosas.git
```

### Instale as dependências
```bash
bundle install
```

### Crie o Banco de Dados
```bash
rails db:create db:migrate db:seed
```

Rodando os testes:
```bash
bundle exec rspec
```

