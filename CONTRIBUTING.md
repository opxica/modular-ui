# Contributing to ModularUI

Thank you for your interest in contributing to Flutter's first UI library ~ Modular UI ! This guide will help you get started.

## Table of Contents

1. [Getting Started](#getting-started)
	- [Requirements](#requirements)
   - [Fork the Repository](#fork-the-repository)
   - [Clone Your Fork](#clone-your-fork)
   - [Create a Branch](#create-a-branch)
3. [Making Changes](#making-changes)
   - [Testing Locally](#testing-locally)
4. [Submitting a Pull Request](#submitting-a-pull-request)

## Getting Started

### Requirements 
1. Flutter SDK needs to be installed
2. Run `flutter create . ` inside the project folder to generate necessary files

### Fork the Repository

Click on the "Fork" button on the top right corner of the repository to create your fork.

### Clone Your Fork

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/opxica/modular-ui.git
```


### Create a Branch

```
git checkout development
git checkout -b <issue-number>
```


## Making Changes
Create all the necessary changes in your branch itself.
### Testing Locally
To test ModularUI  locally while developing, you can follow these steps:

1.  **Link the library to your Flutter project:**
    
    -   In your project, run `flutter pub get` to ensure all dependencies are resolved.
    -   Run `flutter pub global activate --source path <path_to_library>` to make your library available globally.
    -   In your Flutter project, run `flutter pub get` to fetch the local version of your library.
2.  **Import and use the library in your Flutter project:**
    
    -   In your Flutter project, you can now import your library as if it were any other package:

		` import 'package:modular_ui/modular_ui.dart'; `

3. **Update your library code:**
    
    -   As you make changes to ModularUI, you can test them in your Flutter project by running it and checking the changes.


## Submitting a Pull Request

1. Commit your changes and push them to your fork:
	```
	git add .
	git commit -m "Brief description of changes"
	git push origin issue-name
	```

2. Open a pull request against the `development` branch of the original repository.
3. Provide a clear and concise title and description for your pull request.
4. Wait for the maintainers to review and merge your changes.
