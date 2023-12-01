### Execução:

```
export GIT_HASH=c2db8f2a7ae5b225f085c9deb30b0f6b48b027df
version=$(wget -qO- https://raw.githubusercontent.com/gilberto-maess/semversh/master/script.sh | bash -)
echo $version
```

Onde:
`GIT_HASH` é o hash do commit em que será iniciada a contagem da versão.