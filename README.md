# ST0263-Project1

Sitio web para registrar rutas usando localización con GPS. Este proyecto fue creado como parte de la materia de Tópicos Especiales en Telemática.

![Screenshot](/app/assets/images/screenshot1.PNG?raw=true "Title")

## Dependencias

- Ruby
- Ruby on Rails
- NGINX
- SQLite3

## Instalación

Requiere Ruby >=2.5.1

```
git clone https://github.com/Essux/ST0263-Project1
bundle install
rails db:migrate
rails server
```

## Despliegue con Docker-Compose

```
docker-compose build
docker-compose run web rails db:migrate
docker-compose up
```
