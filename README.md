# Eventbrite_like

Ce projet permet de créer des utilisateurs, d'utiliser leurs sessions pour créer des evenements.
Nous avons 3 models : User, Event et EventAttendee.

* Le payement ne fonctionne pas, problème de clé publique ou autre ...
* Le code d'accès pour s'enregistrer est : thpevent

## Presentation du projet
* Inscription, connexion et deconnexion
* Un utilisateur connecté peut créer un evenement

## Lancer le projet
Pour lancer le projet, sur le terminal (dans le dossier concerne) :
```
bundle install --without production
```

```
rails db:migrate
```

```
rails s
```

Vous pouvez observer les pages dans 'localhost:3000'

On y utilise les méthodes suivantes :

* Associations : Belongs_to - Has_many
* Resources : users, events
* On utilise les gems devise et stripe
* CSS : Bootstrap

## Heroku :
* https://arcane-mesa-20328.herokuapp.com/

## CSS
Le CSS est dans le assets/stylesheets/application.css
