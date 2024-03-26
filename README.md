# TrendLease
<br>
TrendLease is a web development project that establishes an innovative online platform for facilitating the rental of unisex clothing items. By providing a seamless and convenient solution, the website addresses the common dilemma faced by individuals who need clothes without the commitment to purchase.  
<br>
<br>
This project was done by Vince Joseph Arbutante, Louise Angela Caballero, Georgette Dalen Cadiz, Wince Larcen Rivano, and Zhen Marie Villanueva, as a machine problem project for IT114L. 

## 1. 💬 How to Configure This Project?

> [!IMPORTANT]
> **Step 1:** Ensure that Microsoft Visual Studio is installed on your system.
>
> **Step 2:** Copy all the contents of the `CompleteSQLStatements.sql` file located inside the `App_Data` folder of your project.
>
> **Step 3:** Right-click on the `App_Data` folder within your Visual Studio project, and select "Add" > "New Item".
>
> **Step 4:** Choose "SQL Server Database" and name the new database file as `TrendLeaseDatabase.mdf`. This will create a new database file within your project.
>
> **Step 5:** Navigate to the "Server Explorer" within Visual Studio. Right-click on "DefaultConnection (TrendLease-WebApp)" and select "Add New Query".
>
> **Step 6:** Paste all the database schemas copied from `CompleteSQLStatements.sql` into the query window.
>
> **Step 7:** Execute and run the query. This will create all the necessary database tables for the program to function smoothly.
>
## 2. 💬 How to run the program?

> [!IMPORTANT]
> **Step 1:** Ensure that Microsoft Visual Studio is installed on your system.
>
> **Step 2:** Open the solution file (`TrendLease-WebApp.sln`) in Microsoft Visual Studio.
>
> **Step 3:** Configure the project settings and dependencies as needed.
>
> **Step 4:** Build and run the project.
>
> **Step 5:** Ensure all functionalities are working as expected.

> [!NOTE]
> - If you encounter any issues during setup or execution, refer to the project documentation or seek assistance from the developer team.

## 3. 💬 What is the architecture of this project?

> [!IMPORTANT]
> The architecture of the TrendLease project follows a web application architecture, comprising multiple layers and components to ensure scalability, reliability, and maintainability. Below is a discussion of a high-level overview of the architecture
> <br /> <br />
> **✨ Client-Side (Frontend) ✨**
> <br />
> **User Interface**
> <br /> 
> The frontend layer consists of the user interface that users interact with. This includes web pages, forms, and elements for browsing clothing items, viewing product details, adding items to the cart, and completing the checkout process.
> <br /> <br />
> **Technologies**
> <br /> 
> HTML, CSS, Bootstrap, Javascript, and ASP NET Webforms
> <br /> <br />
> **Responsibilities**
> <br /> 
> Handling user interactions, displaying data, and making requests to the backend server.
> <br /> <br />
>
> **✨ Server-Side (Backend) ✨**
> <br />
> **Application Logic**
> <br /> 
> The backend layer handles the core application logic, including user authentication, product management, order processing, and payment handling.
> <br /> <br />
> **Technologies**
> <br /> 
> C#
> <br /> <br />
> **Responsibilities**
> <br /> 
> Managing user accounts, processing requests, and interacting with the database.
><br /> <br />
> 
> **✨ Database Layer ✨**
> <br />
> **Database Management System (DBMS)**
> <br /> 
> Stores and manages data related to users, products, orders, and transactions.
> <br /> <br />
> **Schema**
> <br /> 
> Defines the structure of the database tables and relationships between them.
> <br /> <br />
> **Technologies**
> <br /> 
> SQL (Relational databases)
> <br /> <br />
> **Responsibilities**
> <br /> 
> Storing and retrieving data, ensuring data integrity, and supporting complex queries.

## 4. 💬 What are the features of this project?
> [!IMPORTANT]
> <h4>🚀 User Registration and Login Functionality</h4>
> Users can register and create accounts to access the website's features. 
> <br /> <br />
> <h4>🚀 Browsing and Category Options</h4>
> Users can browse clothing items by type or category to easily find items that match their preferences.
> <br /> <br />
> <h4>🚀 Detailed Product Descriptions</h4> 
> Users can view comprehensive product descriptions, including images, sizes, prices, and rental durations, to make informed decisions about which items to rent.
> <br /> <br />
> <h4>🚀 Add to Cart</h4> 
> Users can add desired items to their cart for rental.
> <br /> <br />
> <h4>🚀 Secure Checkout Payment Processing</h4>
> The platform ensures secure checkout and payment processing with various payment methods, allowing users to complete transactions safely.
> <br /> <br />
> <h4>🚀 Order Tracking</h4> 
> Users can track the status of their rental orders via their account dashboard, enabling them to stay updated on their transactions.
> <br /> <br />
> <h4>🚀 Rating System</h4>
> Users can provide ratings on rented items, facilitating communication and enhancing the user experience.
>

