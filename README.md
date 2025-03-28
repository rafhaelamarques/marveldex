# MarvelDex

Seu catálogo de heróis.

## Description

O MarvelDex foi desenvolvido pensando em apresentar informações rápidas e básicas sobre heróis Marvel, como descrição, aparições em quadrinhos e animações.

O app é desenvolvido em Flutter 3.27 pensado para iOS e Android. As principais bibliotecas utilizadas são:

- [BLoC](https://pub.dev/packages/flutter_bloc) para gerenciamento de estados;
- [Freezed](https://pub.dev/packages/freezed) para controle de boilerplate;
- [Dio](https://pub.dev/packages/dio) para requisições REST;
- [GetIt](https://pub.dev/packages/get_it) para injeção de dependências;
- [CachedNetworkImage](https://pub.dev/packages/cached_network_image) para cache de imagens;
- [DotEnv](https://pub.dev/packages/flutter_dotenv) para carregamento de variáveis de ambiente;
- [Mocktail](https://pub.dev/packages/mocktail) para mocks nos testes unitários.

A API utilizada é a [Marvel API](https://developer.marvel.com/documentation/generalinfo).


## Screens
![Screenshots de telas principais](/assets/screenshots/collage.png)


## Getting Started

### Installing

* Siga a documentação oficial do [Flutter](https://flutter-ko.dev/get-started/install) para seu sistema.

### Prerequisites

Antes de executar o projeto, rode os seguintes comandos
```
flutter pub get
```
```
dart run build_runner build
```

Siga as instruções do portal [Marvel Developer](https://developer.marvel.com/documentation/authorization) para gerar sua autenticação.

Renomeie o arquivo .env.example para .env e preencha de acordo.

## APK for Android Devices
[app-release.apk](/assets/app-release.apk)

## Authors

> [Rafhaela Marques](https://www.linkedin.com/in/rafhaela-marques/)

## Version History

* 1.0.0
    * Initial Release