# API Calling in Swift

This document outlines the best practices for API calling in Swift, focusing on:

Performance

Readability

Maintainability

Testability

Scalability

Simplicity


The following example demonstrates a well-structured, scalable approach to API calling using Combine.

**Principles**

SOLID principles are followed. 
Dependency Injection - Dependency are injected.
Combine Framework: Handles asynchronous programming with publishers and subscribers.

**Description**

**LandingView**

Displays two buttons on the landing screen: Recreational Players and Advanced Players. Each button navigates to a different view. When opening a view, the respective APIRequestBuilder and APIService objects are injected into the ViewModel using dependency injection, adhering to the Dependency Inversion Principle (DIP). This abstraction ensures testability and maintains flexibility by avoiding direct object instantiation.

**APIRequestBuilder**

Responsible for constructing API requests with necessary parameters, including the HTTP method (GET/POST), headers, body, and URL path.

**APIService**

Handles API responses. This class is generic, allowing it to work with any model. It is implemented using Combine for reactive data handling.

**RecreationalView**

Displays the user interface for Recreational Players data.

**RecreationalListView**

Renders a list of data for Recreational Players.

**RecreationalUser**

A model representing Recreational Player data fetched from the API.

**RecreationalPlayersMockData**

Provides mock data for unit tests and enables UI rendering with sample data during development.

**RecreationalVM**

Holds the business logic for Recreational Players.

**RecreationalVMTests**

Contains unit tests to validate the functionality of the RecreationalVM.

Same way AdvancedView is created to display Advanced Players data.


