# Practical House Manager

A Flutter application for managing shared living spaces and roommate coordination.

## Features

- **Real-time Shopping List**

  - Collaborative shopping list visible to all roommates
  - Real-time updates using Firebase
  - Add, edit, and mark items as purchased
  - Track who bought what

- **Expense Management**

  - Split bills and expenses among roommates
  - Track shared household expenses
  - Monthly expense summaries
  - Debt settlement tracking
  - Receipt upload and storage

- **Additional Features**
  - Chore schedule and tracking
  - House announcements and notifications
  - Shared calendar for house events
  - Individual and group chat

## Technical Stack

- **Frontend**: Flutter
- **State Management**: Provider
- **Navigation**: Go Router
- **Backend**: Firebase
  - Cloud Firestore for real-time data
  - Firebase Authentication
  - Firebase Storage for files/images
  - Firebase Cloud Messaging for notifications

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Models**: Data structures and business logic
- **Views**: UI components and screens
- **ViewModels**: State management and business logic handling
- **Services**: Firebase and other external service integrations

## Project Structure

lib/
├── models/
├── views/
├── viewmodels/
├── services/
├── routes/
└── utils/

## Getting Started

1. Clone the repository
2. Set up Firebase project and add configuration files
3. Run `flutter pub get` to install dependencies
4. Run the app using `flutter run`

## Dependencies

- provider: ^6.0.0
- go_router: ^10.0.0
- firebase_core: ^2.0.0
- firebase_auth: ^4.0.0
- cloud_firestore: ^4.0.0
- firebase_storage: ^11.0.0

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
