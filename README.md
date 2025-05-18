# Observable Accessibility

A Flutter demonstration project showcasing accessible vs non-accessible implementations of an appointment scheduler application.

## Project Overview

This project maintains two branches:
- **main**: The non-accessible implementation of the appointment scheduler
- **accessible**: The accessible implementation that follows best practices for accessibility

The application is an appointment scheduler that allows users to:
- View a list of upcoming appointments
- Schedule new appointments
- Complete an onboarding process

## Accessibility Features (in the accessible branch)

The accessible branch implements specific improvements for screen reader accessibility:

- **Semantic announcements for appointment deletion**: The delete button is properly labeled with 'Delete appointment' and uses a SnackBar to announce when an appointment has been deleted
- **Vertical navigation for screen reader users in onboarding**: Implements `onIncrease` and `onDecrease` semantic actions to allow screen reader users to navigate the onboarding pages using vertical swipe gestures (up/down) instead of horizontal swiping
- **Explicit semantic nodes**: Uses `explicitChildNodes: true` to ensure proper navigation through UI elements
- **Semantic merging and exclusion**: Uses `MergeSemantics` to combine related elements for screen readers and `ExcludeSemantics` to prevent redundant announcements
- **Proper date formatting for screen readers**: Custom semantic labels for dates to ensure they're properly announced

## Project Structure

The project is organized into:

- **features/**: Contains the main features of the application
  - appointment_list/: View and manage the list of appointments
  - appointment_scheduler/: Schedule new appointments
  - onboarding/: User onboarding process

- **common/**: Shared components and services
  - models/: Data models like Appointment
  - services/: Application services
  - navigation/: Navigation management
  - widgets/: Reusable UI components

## Getting Started

1. Clone the repository
2. Switch between branches to compare:
   ```
   git checkout main     # Non-accessible version
   git checkout accessible  # Accessible version
   ```
3. Run the application:
   ```
   flutter pub get
   flutter run
   ```

## Dependencies

- flutter_bloc: State management
- shared_preferences: Local storage
- accessibility_tools: Accessibility testing and improvement tools
- freezed: Code generation for immutable classes
- intl: Internationalization and formatting

## Purpose

This project serves as an educational resource to demonstrate the importance of accessibility in mobile applications and how to implement accessible patterns in Flutter. By comparing the two branches, developers can see concrete examples of how to improve application accessibility.
