# Programação Móvel - Suplementos

- O aplicativo foi desenvolvido para Android
- Para rodar a aplicação foi utilizada o Flutter na versão 3.22.3
- Para emulação da aplicação pelo Android Studio foi utilizado a imagem de sistema API 34
- Foi preciso adicionar o Firebase ao projeto para realizar o login
- Além de adicionar o Firebase, algumas configurações foram realizadas para permitir a autenticação com o Google
- Tenha o Docker instalado na máquina
- Tenha um software de SQL instalado

ATENÇÃO: Utilize a versão do Flutter e da imagem aqui listadas, além disso configure corretamente o Firebase em sua máquina e faça as configurações necessárias para uso dele no Android e também para permitir o uso da autenticação com o Google, como registrar o aplicativo em um projeto do Firebase.

Utilize da documentação da [Firebase](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android) e se sentir necessidade procure por vídeo-aulas, sempre siga as orientações dadas pelo Console do Firebase.

Primeiro, vamos configurar o Docker

Na linha de comando no projeto, caminhe até a pasta do Docker e rode o comando:

```
cd docker

docker-compose up -d
```

Depois abra seu software de SQL e rode todos os comandos no arquivo 'suplementos.sql'

Feita todas as configurações prévias para o app, após instalar a aplicação você deve rodar na linha de comando:

```
flutter pub get
```

Feito isso, o aplicativo pode ser inicializado.
