# Task Adder App 📝

A simple Flutter Task Management application built with **Sqflite (SQLite)** for local data persistence. Users can create, update, delete, and mark tasks as completed. All tasks are stored locally on the device.

---

## ✨ Features

* ➕ Add new tasks
* ✏️ Edit existing tasks
* 🗑️ Delete tasks
* ✅ Mark tasks as completed/incomplete
* 💾 Local data storage using SQLite (Sqflite)
* 📱 Simple and clean UI

---

## 📸 App Preview

### Home Screen

<!-- Add image here -->

![Home Screen](screenshots/home.png)

### Add Task

<!-- Add image here -->

![Add Task](screenshots/add_task.png)

### Edit Task

<!-- Add image here -->

![Edit Task](screenshots/edit_task.png)

### Task Completed

<!-- Add image here -->

![Task Completed](screenshots/task_completed.png)

> Replace the images above with your actual screenshots.

---

## 🛠️ Tech Stack

* Flutter
* Dart
* Sqflite (SQLite Database)
* Path Package

---

## 📂 Project Structure

```text
lib/
│
├── main.dart
├── myapp.dart
│
├── loacl_DB/
│   ├── DB/
│   │   └── task_database.dart
│   │
│   ├── model/
│   │   └── task_model.dart
│   │
│   └── ui/
│       └── task_home_page.dart
│
└── generated/
    └── assets.dart
```

---

## 🗄️ Database Schema

### Table: `tasks`

| Column | Type    | Description                              |
| ------ | ------- | ---------------------------------------- |
| id     | INTEGER | Primary Key (Auto Increment)             |
| title  | TEXT    | Task Title                               |
| isDone | INTEGER | Task Status (0 = Pending, 1 = Completed) |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  sqflite: ^2.4.2+1
  path: ^1.9.1
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/task_adder_app.git
```

### 2. Navigate to Project Directory

```bash
cd task_adder_app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the App

```bash
flutter run
```

---

## 📖 How It Works

### Add Task

Users can enter a task title and tap the add button to save it in the local SQLite database.

### Update Task

Tap the edit icon to modify an existing task.

### Delete Task

Tap the delete icon to remove a task permanently.

### Complete Task

Use the checkbox to mark a task as completed or pending.

---

## 🔧 Packages Used

| Package | Purpose                          |
| ------- | -------------------------------- |
| sqflite | Local SQLite database operations |
| path    | Database path management         |

---

## 🎯 Future Improvements

* Task categories
* Due dates
* Search functionality
* Dark mode support
* Task priority levels
* State management (Provider / Riverpod / Bloc)

---

## 👨‍💻 Author

Developed with Flutter and Sqflite.

Feel free to fork, improve, and contribute to this project.

Md Yeasin khan
