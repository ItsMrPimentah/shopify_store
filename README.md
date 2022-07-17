# Shopify Challenge

Challenge consumo da api de uma loja shopify, apresentando as tags e os produtos que correspondem a cada tag.
![](screenshots/ezgif.com-gif-maker.gif)

## Pages

### Tags Page

Um Widget Statefull, responsavel por apresentar as tags unicas inseridas em cada produto e poder navegar entre elas, dado os conceitos de UX, decidi combinar as telas podendo assim, visualizar os produtos em cada tag na mesma tela.
![](screenshots/tag_screen.png)

- Variaveis

```Dart
 List<Product> _products = [];
 //Após o get a variavel _products é responsavel,
 //por receber todos os produtos, ou seja os dados sem qualquer tratamento.

  List<String> tags = [];
  // Lista de Strings usada para filtrar todas as Tags.

  List<String> orderedTags = [];
  // A função toSet() apresentou algumas limitações no processo de adicionar as tags na lista tags,
  // desta forma usei esta segunda variavel para ordenar a lista de tags de modos a apresentar tags unicas.

  List<Product> filteredProducts = [];
  //Lista de produtos usadas, para receber a seleção das tags na Tabbar, desta forma podemos visualizar
  // apenas a tag selecionada.
```

- initiState

```Dart
 @override
  void initState() {

    //Ao inicializar o cliclo de vida do widget, a requisição e efectuada por REST Api
    // tratando-se de um widget com estado, faço o uso do setState para assinar novos valores as variaveis.
  ApiRequest().get(accessToken: "myAccessToken").then(
      (value) {
        // Value: Recebe a lista completa de produtos
        setState(() {
        // _products: recebe a mesma lista de produtos de modos a trabalhar por cima dela para entregar
        // a tela os dados necessários.
          _products = value;

        //Duplo loop for, para percorrer a lista de produtos, e recolher as tags unicas em cada produto.
          for (var element in _products) {
            for (var tag in element.tagsList!) {

              // a lista tags, recebe todas as tags anteriormente inseridas em listas de strings,
              // nessa assinatura, ela recebe uma unica lista, porém sem recolher os dados duplicados.
              tags.add(tag.trim());

              // o processo de recolha das tags duplicadas, ocorre com a orderedTags.
              orderedTags = tags.toSet().toList();

              // filteredProducts recebe como valor inicial, a lista de produtos, a que corresponde a primeira tag.
              filteredProducts = _products
                  .where(
                    (element) => element.tags!.contains(
                      tags.first.trim(),
                    ),
                  )
                  .toList();
            }
          }
        });
      },
    );
    super.initState();
  }



```

### Product Page
