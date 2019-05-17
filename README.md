# Commander 2
[![Build Status](https://travis-ci.org/pharo-spec/Lieutenant.svg?branch=master)](https://travis-ci.org/pharo-spec/Lieutenant)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/DataFrame/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

Implementation of the command design pattern with the following objectives:
- Simple model of commands
- Ease reusability of commands accross multiple tools / framework
- Instance of commands can be modified (e.g., name, description, etc...)
- Pluging custom user-command made easy

## Install

```Smalltalk
Metacello new
	repository: 'github://pharo-spec/Commander2/src';
	baseline: 'Commander2';
	load
```

## Example
`Commander2-ContactBook` package contains an example of Commander2 usage in the context of a Spec application.

The following code should be checked when learning how to use the framework:

- `CmContactBookCommand` and subclasses are the definition of commands required by the example application.
- `CmContactBookPresenter class>>#buildCommandsGroupWith:forRoot:` This method is the entry point to describe commands available to your Spec presenter. One can learn how to build group of commands from this method.
- `CmContactBookPresenter>>#initializeWidgets` This method shows how to inject a Spec's `MenuPresenter` built from a command group in your presenter.
- `CmContactBookPresenter>>#initializeWindow:` This method shows how to bind the shortcuts defined by your command group to your Spec presenter.
