class Label {
  final int id; // bigint [pk, increment] - Primary key, auto-incrementing
  final String name; // varchar(255) [not null]

  Label({
   required this.id,
    required this.name,
  });
}

//sample of  labels 
// List<Label> labels = [
//   Label(id: 1, name: 'Feature'),
//   Label(id: 2, name: 'Bug'),
//   Label(id: 3, name: 'UI/UX Improvement'),
//   Label(id: 4, name: 'Backend Task'),
//   Label(id: 5, name: 'Frontend Development'),
//   Label(id: 6, name: 'Documentation Update'),
//   Label(id: 7, name: 'Testing Required'),
//   Label(id: 8, name: 'High Priority Issue'),
//   Label(id: 9, name: 'Planning Meeting'),
//   Label(id: 10, name: 'Design Implementation'),
// ];

enum LabelOptions {
  feature,
  bug,
  uiUx,
  backend,
  frontend,
  documentation,
  testing,
  urgent,
  highPriority,
  mediumPriority,
  lowPriority,
  planning,
  design,
  development,
  review,
  blocked,
}
