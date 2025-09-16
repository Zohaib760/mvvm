Flutter Movies App
A Flutter application built using the MVVM architecture pattern with Provider for state management, REST API integration, and Shared Preferences for local data persistence.

Features
User Authentication
Login with email and password
Create new account
Session management using Shared Preferences

Movies Catalog
Browse list of movies fetched from REST API
Clean and intuitive UI

State Management
MVVM architecture pattern

Provider for efficient state management

Architecture
This app follows the MVVM (Model-View-ViewModel) architecture pattern:

Model: Data classes and API service layer

View: UI components (Widgets)

ViewModel: Business logic and state management using Provider

API Integration
The app integrates with REST APIs for:

User authentication (POST /login)

Account creation (POST /register)

Fetching movies list (GET /movies)

Packages Used
provider: State management

http: API calls

shared_preferences: Local storage for session management

flutter_secure_storage: Secure credential storage (optional)
