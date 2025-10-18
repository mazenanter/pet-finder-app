# 🐾 Pet Finder App

A Flutter application built using **Clean Architecture**, designed to help users explore and favorite pet breeds through an intuitive and responsive interface.  
This project demonstrates **best practices** in architecture, API integration, and testing.

---

## 🧱 Project Overview

The app allows users to:
- Browse available pet breeds.
- View detailed breed information.
- Add or remove breeds from favorites.
- Store favorites through API integration.
- Handle user actions using Cubit (Bloc State Management).

The application follows the **Clean Architecture** pattern to separate concerns and ensure scalability, testability, and maintainability.

---

## 🧩 Tech Stack

| Layer | Technology |
|-------|-------------|
| State Management | **Cubit (Bloc)** |
| Networking | **Dio + Retrofit** |
| Architecture | **Clean Architecture** |
| Serialization | **json_serializable** |
| Design | **Responsive UI (ScreenUtil)** |
| Testing | **Unit, Widget, Integration Tests** |

---

## 🧠 Folder Structure
```
lib/
├── core/
│ ├── constants
│ ├── di/ # Dependency injection setup
│ ├── helpers/ # Utility and helper functions
│ ├── models/ # Shared models used across features
│ ├── networking/ # API setup, Dio & Retrofit configuration
│ ├── routing/ # App routes and navigation management
│ ├── widgets/ # Reusable UI components (buttons, text fields, etc.)
│ └── themes/ (optional) # Global theme setup and colors
│
├── features/
│ ├── home/
│ │ ├── data/ # Data layer (models, data sources, repositories impl)
│ │ ├── domain/ # Business logic layer (entities, repositories, use cases)
│ │ └── presentation/ # UI layer (screens, cubits/blocs, widgets)
│ │
│ ├── favorite/
│ │ ├── data/ # Data layer (models, data sources, repositories impl)
│ │ ├── domain/ # Business logic layer (entities, repositories, use cases)
│ │ └── presentation/ # UI layer (screens, cubits/blocs, widgets)
│ │
│ └── onboarding/
│ └── presentation/ # UI only (no domain or data)
│
└── main.dart # App entry point
```

## 🧪 Testing Strategy

The project includes **three main types of tests** to ensure functionality and reliability.

### 1️⃣ Unit Tests  
Focus on **business logic** and **use cases** (without UI).

Examples:
- `AddBreedToFavoriteUseCase` → Verify it calls the correct repository method.
- `FavoriteCubit` → Ensure states are emitted correctly (`Loading`, `Success`, `Failure`).

### 2️⃣ Widget Tests  
Focus on **UI components** and **state-driven UI updates**.

Examples:
- `FavoriteButton` → Check the icon color changes when toggled.
- `FavoriteScreen` → Ensure the correct widgets are displayed based on state.

### 3️⃣ Integration Tests  
Focus on **end-to-end flow** — from user action to API response.

Examples:
- User adds a breed to favorites → Check it appears on the favorites screen.
- API integration with Dio and Retrofit returns correct models.

---

## 🧭 How to Run Tests

### 🧰 Prerequisites
Make sure you have Flutter installed and your dependencies up to date:
```bash
flutter pub get
```
# ▶️ Run All Tests
```
flutter test
```
# ✅ Testing Libraries Used

flutter_test — Core Flutter testing framework.

mockito — Mocking dependencies for unit tests.

bloc_test — Testing Cubit and Bloc state transitions.

integration_test — For full app flow testing.

## SCREENSHOTS
![Untitled design](https://github.com/user-attachments/assets/33daa63f-a2a3-442f-b1bb-74d40f7910bb)


#💬 Author

Mazen Anter
💻 Flutter Developer | Backend .Net

