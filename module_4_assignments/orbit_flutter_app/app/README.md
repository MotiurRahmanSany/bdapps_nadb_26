# Orbit

A simple 3-screen Flutter app built for the assignment: **Login → Home → Profile**,
using the three required packages:

- **provider** – app-wide state management (`AuthProvider`)
- **shared_preferences** – persists the login session and display name on-device
- **go_router** – declarative navigation with auth-aware redirects

## How it works

1. `AuthProvider` (`lib/providers/auth_provider.dart`) holds `isLoggedIn`,
   `userName`, `userEmail`, and reads/writes them with `SharedPreferences`.
2. `lib/router/app_router.dart` builds a `GoRouter` with three routes
   (`/login`, `/home`, `/profile`) and a `redirect` callback that:
   - sends you to `/login` if you're not logged in and try to open `/home` or `/profile`
   - sends you to `/home` if you're already logged in and land on `/login`
   - it listens to `AuthProvider` via `refreshListenable`, so this happens
     automatically the instant you log in or log out — no manual `context.go()`
     needed after login/logout.
3. `lib/main.dart` wires everything together with `ChangeNotifierProvider` +
   `MaterialApp.router`.

## Screens

- **Login** (`lib/screens/login_screen.dart`) – form with email/password
  validation. Any email containing `@` and a password of 4+ characters
  "logs in" (no real backend — this is a demo auth flow).
- **Home** (`lib/screens/home_screen.dart`) – welcome message using the
  saved name/email, buttons to go to Profile or Logout.
- **Profile** (`lib/screens/profile_screen.dart`) – shows email, lets you
  edit + save your display name (persisted via SharedPreferences), and logout.

## Run it

```bash
flutter pub get
flutter run
```

## Project structure

```
lib/
  main.dart
  providers/
    auth_provider.dart
  router/
    app_router.dart
  screens/
    login_screen.dart
    home_screen.dart
    profile_screen.dart
```

## Ideas if you want to extend it for extra credit

- Replace the fake `login()` check with a real API call.
- Add a splash/loading screen while `AuthProvider.init()` runs.
- Store a profile picture using `image_picker` + local file storage.
- Add an `/edit-profile` route and split editing out of the Profile screen.
