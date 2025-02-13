# Practical House Manager

A Flutter application for managing shared living spaces and roommate coordination.

## Features

- **Real-time Shopping List**

  - Collaborative shopping list visible to all roommates
  - Real-time updates using WebSocket
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
- **State Management**: MobX
- **Navigation & DI**: Flutter Modular
- **Backend**: RESTful API & WebSocket
  - Dio for HTTP requests
  - WebSocket for real-time features
  - JWT Authentication
  - Cloud Storage for files/images
  - WebSocket for real-time notifications

## Architecture

The application follows a Modular MVVM architecture with Repository pattern:

- **Models**: Data structures and entities
- **Views**: UI components and screens
- **Stores**: State management with MobX
- **Repositories**: Data layer abstraction
- **Services**: API, WebSocket, and other external service integrations

## Project Structure

```bash
lib/
├── app/
│ ├── modules/
│ │ ├── auth/
│ │ ├── shopping/
│ │ ├── expenses/
│ │ └── chores/
│ ├── core/
│ │ ├── services/
│ │ ├── widgets/
│ │ └── utils/
│ └── main.dart

Each module follows:
module/
├── models/
├── pages/
├── stores/
├── repositories/
├── services/
└── module.dart
```

## Getting Started

1. Clone the repository
2. Configure environment variables
3. Run `flutter pub get` to install dependencies
4. Clone and run the Go API from https://github.com/limadlp/house-manager-api
5. Run the app using `flutter run`

## Dependencies

- flutter_modular: ^6.3.4
- mobx: ^2.5.0
- flutter_mobx: ^2.3.0
- dio: ^5.8.0+1
- web_socket_channel: ^3.0.2
- flutter_staggered_grid_view: ^0.7.0
- logging: ^1.3.0
- build_runner: ^2.4.14
- mobx_codegen: ^2.7.0

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
