Retail Store Database
Introduction

This repository contains SQL scripts for creating and populating a retail store database using a top-down approach. The database is designed to manage and track various aspects of a retail store, including products, customers, orders, inventory, and more.

The database schema includes 12 tables, each serving a specific function within the retail store's operations. The relationships between these tables ensure data integrity and enable efficient querying of the database.
Database Tables

The database consists of the following tables:

    Departments: Stores information about the different departments within the retail store.
    Suppliers: Contains details about suppliers who provide products to the store.
    Products: Holds data about the products available for sale in the store.
    Customers: Stores information about the customers of the retail store.
    Employees: Contains details about the employees working in the store.
    Orders: Records the orders placed by customers.
    OrderDetails: Links products to orders (many-to-many relationship).
    Inventory: Tracks the stock levels of products.
    Payments: Records payment information for customer orders.
    Promotions: Contains details about promotions and discounts offered by the store.
    OrderPromotions: Links promotions to specific orders.
    Shippers: Stores information about the shipping providers used by the store.

Table Relationships

    Departments have a one-to-many relationship with Products.
    Suppliers have a one-to-many relationship with Products.
    Customers have a one-to-many relationship with Orders.
    Employees have a one-to-many relationship with Orders.
    Orders have a many-to-many relationship with Products, implemented via the OrderDetails table.
    Products have a one-to-one relationship with Inventory.
    Orders have a one-to-many relationship with Payments.
    Promotions have a many-to-many relationship with Orders, implemented via the OrderPromotions table.
