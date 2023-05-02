# Time Registration App

The task is to implement a simple iOS application that solves the following two user stories: 

As a freelance I want to be able to:
- Register the time I spend on my projects, so that I can create correct invoices for my customers
- Get an overview of my time registrations, so that I can create correct invoices for my customers


This Xcode project is a simple Swift application that uses the VIPER architecture pattern, the Realm database, and the RXSwift framework. It is designed to provide a basic example of how to structure an iOS application using VIPER and how to use Realm and RXSwift to manage data and asynchronous operations.



# Architecture

The project uses the VIPER architecture pattern. This pattern separates the application into five distinct layers, with each layer having a specific responsibility:

- View: Handles the user interface and user input.
- Interactor: Handles the business logic and data operations.
- Presenter: Handles the presentation logic and communicates with the view and interactor.
- Entity: Contains the data models and entities used by the application.
- Router: Handles navigation between screens.

The project also uses the Realm database, which is a mobile database that allows for easy storage and retrieval of data. 

It also uses the RXSwift framework, which is a reactive programming framework that allows for declarative programming of asynchronous operations. This allows for a more concise and readable code, as well as easier management of data flows.
