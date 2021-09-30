[![Contributors][contributors-shield]][contributors-url]
[![Commits][commits-shield]][commits-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/DaniloLira/iBerro">
    <img src="assets/logo.jpg" alt="Logo" width="180" height="180">
  </a>

  <h3 align="center">iBerro</h3>

  <p align="center">
    O iBerro é um jogo multijogador e casual de cantar com os amigos
    <br />
    <a href="https://github.com/DaniloLira/iBerro"><strong>Explore a documentação »</strong></a>
    <br />
    <br />
    <a href="https://github.com/DaniloLira/iBerro">TestFlight</a>
    ·
    <a href="https://github.com/DaniloLira/iBerro">Reporte Bug</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Tabela de conteúdo

* [Sobre o projeto](#sobre-o-projeto)
* [Tecnologias utilizadas](#tecnologias-utilizadas)
* [Gitflow](#gitflow)


<!-- ABOUT THE PROJECT -->
## Sobre o projeto
O iBerro é um aplicativo desenvolvido para iPad onde o jogador canta com seus amigos e é avaliado se conseguiu acertar a letra da música. A aplicação foi criada utilizando o GameCenter como gerenciador de conexões online e a API da Apple Music para reproduzir partes das músicas. O jogo foi desenvolvido durante um challenge da Apple Developer Academy (UFPE) e possibilitou vários aprendizado em relação a integração dos diferentes frameworks utilizados

| Esperando | Jogando | Ranking |
|----------|----------|----------|
| <img src="assets/esperando.png" alt="Sala de espera" width="180.5" height="406">  |  <img src="assets/jogando.png" alt="Jogando" width="180.5" height="406">  |  <img src="assets/ranking.png" alt="Tela de Ranking" width="180.5" height="406">  |


### Tecnologias utilizadas
Aqui listamos as tecnologias utilizadas para a construção deste projeto
* [Swift](https://swift.org/)
* [GameCenter](https://developer.apple.com/game-center/)
* [Apple Music](https://developer.apple.com/documentation/applemusicapi/)
* [Swift UI](https://developer.apple.com/documentation/swiftui/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/DaniloLira/iBerro.svg?style=flat-square
[contributors-url]: https://img.shields.io/github/contributors/DaniloLira/iBerro
[forks-shield]: https://img.shields.io/github/forks/DaniloLira/iBerro.svg?style=flat-square
[forks-url]: https://img.shields.io/github/forks/DaniloLira/iBerro
[commits-shield]: https://img.shields.io/github/last-commit/DaniloLira/iBerro.svg?style=flat-square
[commits-url]: https://img.shields.io/github/last-commit/DaniloLira/iBerro
[stars-shield]: https://img.shields.io/github/stars/DaniloLira/iBerro.svg?style=flat-square
[stars-url]: https://img.shields.io/github/stars/DaniloLira/iBerro
[issues-shield]: https://img.shields.io/github/issues/DaniloLira/iBerro.svg?style=flat-square
[issues-url]: https://img.shields.io/github/issues/DaniloLira/iBerro
[product-screenshot]: images/screenshot.png

<!-- Git Flow -->
## Git Flow

### Add new Feature or fix a Bug

1. Create your Feature or Fix Branch
  * `git checkout -b feature/AmazingFeature`
  * `git checkout -b fix/AmazingFix`
  * `git checkout -b test/AmazingTest`
2. Commit your Changes
  * `git commit -m 'Feature(AmazingFeature): Add some AmazingFeature`
  * `git commit -m 'Fix(AmazingFix): Fixes a bug`
  * `git commit -m 'Test(AmazingFeature): UI Button Test
3. Push to the Branch
  * `git push origin feature/AmazingFeature`
  * `git push origin fix/AmazingFix`
4. Open a Pull Request in Github's Pull request tab and fill it with the above Pull Request Template.
5. If the Pull Request is not able to merge automatically do the following steps while on your branch:
```sh
git pull develop
```
6. Solves conflicts in Xcode, and commit your changes
7. Add reviewers to your Pull Request and wait for approval.

## Pull Request Template
```sh
### Issue Name
**What I did:**

- First thing I did...

- Second thing I did...

**How to test:**

- Brief notes on how to check if the feature works correctly.
```
