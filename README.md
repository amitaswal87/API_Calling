# API Calling in Swift

This document outlines the best practices for API calling in Swift, focusing on:

- **Performance**
- **Readability**
- **Maintainability**
- **Testability**
- **Scalability**
- **Simplicity**

## Example Overview

The following example demonstrates a well-structured, scalable approach to API calling using **Combine**.

---

## Principles

The following principles are adhered to in this implementation:

- **SOLID Principles**: The architecture follows SOLID principles, ensuring that the code is clean, modular, and easy to maintain.
  
- **Dependency Injection**: Dependencies are injected into classes, rather than being hard-coded. This ensures greater flexibility and ease of testing.
  
- **Combine Framework**: The Combine framework is used to handle asynchronous programming with publishers and subscribers. This provides a declarative way to handle asynchronous events.

---

## Key Components

### **LandingView**
- **Description**: The **LandingView** displays two buttons on the landing screen: **Recreational Players** and **Advanced Players**. Each button navigates to a different view. 
- **Functionality**: Upon opening a view, the respective **APIRequestBuilder** and **APIService** objects are injected into the **ViewModel** using **Dependency Injection**. This follows the **Dependency Inversion Principle (DIP)**, ensuring the architecture is testable, flexible, and easy to modify.

---

### **LandingViewModel (ViewModel)**
- **Description**: The **LandingViewModel** holds the business logic for the creation of  **RecreationalViewModel** and **AdvancedViewModel** which are being used in creation of **RecreationalView** and **AdcancedView**.

---

### **APIRequestBuilder**
- **Description**: The **APIRequestBuilder** is responsible for constructing API requests with the necessary parameters, including:
  - HTTP Method (GET/POST)
  - Headers
  - Body
  - URL path
- **Purpose**: This helps in the dynamic creation of API requests with the necessary configurations.

---

### **APIService**
- **Description**: The **APIService** handles the API responses. This class is generic and can work with any model. 
- **Implementation**: **Combine** is used for reactive data handling, providing a clean and responsive approach to handling network requests.

---

### **RecreationalView**
- **Description**: The **RecreationalView** is responsible for displaying the user interface for **Recreational Players** data.

---

### **RecreationalListView**
- **Description**: The **RecreationalListView** renders a list of data for **Recreational Players**. It takes the data from the **RecreationalViewModel** and displays it.

---

### **RecreationalUser**
- **Description**: The **RecreationalUser** model represents the data fetched from the API. It contains the properties related to the recreational player such as:
  - Name
  - Username
  - Phone
  - Address (City, State)

---

### **RecreationalMockDataProvider**
- **Description**: Provides mock data for unit tests. This data is also used to render the UI with sample data during the development phase. The data is fetched from a local **RecreationalPlayersMockData.json** file.

---

### **RecreationalViewModel (ViewModel)**
- **Description**: The **RecreationalVM** holds the business logic for the **Recreational Players** feature. It is responsible for managing the state and fetching data via the **APIService**.

---

### **RecreationalVMTests**
- **Description**: The **RecreationalVMTests** file contains unit tests that validate the functionality of the **RecreationalVM**. It ensures that the business logic works correctly by testing various scenarios like fetching data, handling errors, and other important behaviors.

---

## Advanced View
- **Description**: Similarly, an **AdvancedView** is created to display data related to **Advanced Players**. The components and structure are similar to the **RecreationalView**, but it interact with different data models and endpoint.

---

### **URLSessionMockTests**
- **Description**: The **URLSessionMockTests** file contains unit tests that validate the functionality of the **APIService** while mocking **URLSession**. It ensures the testing of API without hitting actual endpoints. It provides flexibility to simulate different server responses (e.g., success, failure, timeouts).

---

### **Service Classes**
- **APIRequestBuilder**: The **APIRequestBuilder** class builds URLRequest with required parameters.

- **APIService**: The **APIService** class makes the network call and fetched data.

- **JSONFetcher**: The **JSONFetcher** class fetches JSON from provided URL.

- **BaseURLProviderFactory**: The **BaseURLProviderFactory** class provides the base URL of the server depending upon the environment i.e. test or prod.

- **TestBaseURLProvider**: The **TestBaseURLProvider** is used by **BaseURLProviderFactory** for creating test environment base URL.

- **ProdBaseURLProvider**: The **TestBaseURLProvider** is used by **BaseURLProviderFactory** for creating test environment base URL.


- **URLSessionAdapter**: The **URLSessionAdapter** class creates URLSession depending upon requirement. When required a MockSession can be created and when required URLSession can be created.

---

## Conclusion

This approach follows best practices for API integration and adheres to **SOLID principles**, ensuring that the code is maintainable, testable, and scalable. By utilizing **Combine**, **Dependency Injection**, and structured design, the app is prepared to handle future feature expansions in an efficient manner.
