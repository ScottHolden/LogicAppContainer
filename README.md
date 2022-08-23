# LogicAppContainer
A small LogicApp Container demo

```
docker build --tag logicappcontainer .
docker run -d -e WEBSITE_HOSTNAME=localhost -p 8080:80 logicappcontainer
```