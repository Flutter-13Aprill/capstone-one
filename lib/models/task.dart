import 'package:project_flow/models/label.dart';

class Task {
  final int id; 
  final String title;
  final String description; 
  final bool isCompleted; 
  final LabelOptions label; 
  final double percentage; 
  

  Task( {
    required this.id,
    required this.label,
    required this.isCompleted,
    required this.percentage,
    required this.title,
    required this.description,
  });
}

//----- task for applicationDesign
List<Task> applicationDesignTasks = [
  Task(
    id: 1,
    title: 'Design Login Screen',
    description: 'Create the UI for user login and registration.',
    label: LabelOptions.design,
    isCompleted: true, percentage: 1,
  ),
  Task(
    id: 2,
    title: 'Design User Profile Page',
    description: 'Develop the visual layout and elements for the user profile.',
    label: LabelOptions.design,
    isCompleted: false,
    percentage: 0.7,
  ),
  Task(
    id: 3,
    title: 'Create Wireframes for Dashboard',
    description: 'Outline the structure and key components of the main dashboard view.',
    label: LabelOptions.design,
    isCompleted: true,
    percentage:1,
  ),
  Task(
    id: 4,
    title: 'Design Navigation Flow',
    description: 'Map out the user journey and transitions between different screens.',
    label: LabelOptions.frontend,
    isCompleted: false,
    percentage: 0.8,
  ),
  Task(
    id: 5,
    title: 'Finalize UI Kit and Style Guide',
    description: 'Document the reusable UI components, colors, typography, and overall style.',
    label: LabelOptions.frontend,
    isCompleted: false,
    percentage: 0.4,
  ),
];

//----- task for edesignDatabase
List<Task> redesignDatabaseTasks = [
  Task(
    id: 6, // Continuing ID sequence
    title: 'Analyze Current Database Schema',
    description: 'Review the existing database structure, identify limitations and areas for improvement.',
    label: LabelOptions.backend,
    isCompleted: true,
    percentage: 1,
  ),
  Task(
    id: 7,
    title: 'Design New Database Model',
    description: 'Create the conceptual and logical models for the redesigned database, including entities, attributes, and relationships.',
    label: LabelOptions.backend,
    isCompleted: true,
    percentage: 1,
  ),
  Task(
    id: 8,
    title: 'Plan Data Migration Strategy',
    description: 'Develop a detailed plan for migrating data from the old database to the new schema, considering data integrity and minimal downtime.',
    label: LabelOptions.backend,
    isCompleted: false,
    percentage: 0.2,
  ),
  Task(
    id: 9,
    title: 'Implement New Database Schema',
    description: 'Create the physical database schema based on the designed model, including tables, indexes, and constraints.',
    label: LabelOptions.documentation,
    isCompleted: false,
    percentage: 0.4,
  ),
  Task(
    id: 10,
    title: 'Test Data Migration and Integrity',
    description: 'Execute the data migration process in a test environment and verify the integrity and accuracy of the migrated data.',
    label: LabelOptions.documentation,
    isCompleted: false,
    percentage: 0.6,
  ),
];

