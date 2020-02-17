# Time Registration App

I chose VIPER as arcitecture and Realm as storage. 
Viper encourages a separation of concerns and is a delegate driven architecture. So, most of the communication between different layers executes through delegation. One layer calls another through a protocol. Calling layer just calls a function from a protocol. Listening layer conforms to that protocol and implements the function.

In one view of the app in "Add Time Module" I used RxSwift. Because the app needed to react to some events in a reactive way, so I found it good use case for using RxSwift and to showcase my ability to use it. I know that it's just a tool, it's not a superhero tool.

VIPER layers's separation conforms to the Single *Responsibility Principle*. The Interactor is responsible to the business analyst, the Presenter represents the interaction designer,  the View is responsible to the visual designer and Router contains navigation logic for describing which screens are shown in which order. 


**Data Layer**

Data Manager is responsible for providing entities to an Interactor. Interactor do not know how to persist the entities.
Entities are the Realm objects manipulated by an Interactor. The Interactor never passes entities to the presentation layer. I wanted my Realm objects to remain behind my data layer. Interactors should not work with Realm objects.  I defined entities outside the VIPER module structure (in the DataManager layer), because these entities are shared across the system. One key point to help me truly decouple my modules is to keep all entities on a separate folder, linking them to the project itself and not to any specific module.

 
 
 **Advantages of using VIPER**
 
 Simplicity - for large teams on complex projects
 Scalability - simultaneous work seamlessly
 Reusability - decoupled app components based on roles
 Consistency - module skeletons, separation of concerns
 Clarity - Single responsibilities (SOLID)
 Testability - separated small classes, TDD, better code coverage
 Bug fixing - easier to track issues, locate bugs and problems
 Source control - smaller files, less conflicts, cleaner code
 Easy - codebase looks similar, faster to read others work


 **Drawbacks**
 
 Verbosity - many files per module
 Complexity - many protocols and delegates
 On-boarding - lack of proper VIPER knowledge


**Test**

I wrote unit tests for interactor and presenter of each VIPER module. Because interactor contains main business logic and presenter contains logic responsible for preparing data before displaying, these components seemed to me more critical than others.

**App Features**:

1. Add a project to a list
2. Display project list with their total time registrations
3. Delete a project from list
4. Add time to a project
5. Display a list of registration times for a project
6. Delete a registered time 
7. Share a project's total hours 




