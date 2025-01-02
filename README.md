# API Calling in Swift

This document outlines the best practices for API calling in Swift, focusing on:

Performance

Readability

Maintainability

Testability

Scalability

Simplicity


The following example demonstrates a well-structured, scalable approach to API calling using Combine.

1. Architecture Overview

Layers

Service Layer: Handles the network requests and API interactions.

Repository Layer: Acts as a mediator between the service layer and the ViewModel.

ViewModel Layer: Manages state and business logic, exposed to the UI.

Principles

SOLID principles are followed. 
Dependency Injection - Dependency are injected.
Combine Framework: Handles asynchronous programming with publishers and subscribers.
