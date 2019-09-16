# ClydesdaleChallenge
Clydesdale developer challenge implementation

# Installation

- Clone project
- Open the project file and run

# Features

- Accessible
- Testable
- Modular
- Supports different dev environments through Environment protocol (For more custom environmental support would use target/xcconfig combinations)
- Modular using MVC and MVP architectures as well as clear DI strategy, generic classes etc.
- Parts of the code could be reused in other projects
- App is easily extendable
- Because of previously mentioned factors as well as code base comments - people should be able to pick up the code base faily quickly

# A few comments abount extent of implementation of the challenge

- People and rooms section could be made to page if there were enough elements in the production app, as well as search field added to find the people quick if there were many records.

# Troubleshooting

In case project does not build right out of the box
- Install library management tool 'Carthage' by executing 'brew install carthage' in terminal
- Cd into project directory using terminal and execute 'carthage update --platform iOS' to install all the support libraries
- 
