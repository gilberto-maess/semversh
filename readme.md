# GITVERSION SH

Chega de instalar dependências desnecessárias para obter uma simples versão semântica embasadas nos commits git.
Seinta-se à vontade para contribuir.

### Execução:

```
export GIT_HASH=f012a0cc40a4bf64458bd6e6dea1ddb549ec495e

version=$(wget -qO- https://raw.githubusercontent.com/gilberto-maess/semversh/master/script.sh | bash -)

echo $version
```

Onde:
`GIT_HASH` é o hash do commit em que será iniciada a contagem da versão.
