import 'dart:io';

void main() {
  // storing all students in a list of maps
  List<Map<String, dynamic>> studentList = [];

  print("Welcome to Programming Club Student Information System");
  print("Collecting information from students");
  print("------------------------------------------------------");

  // using for loop to collect data from students
  for (int i = 0; i < 5; i++) {
    print("\nEnter information for student ${i + 1}:");

    // taking all inputs from user
    stdout.write("Name: ");
    String name = stdin.readLineSync()!;

    stdout.write("About (details): ");
    String details = stdin.readLineSync()!;

    stdout.write("Present Address: ");
    String presentAddress = stdin.readLineSync()!;

    stdout.write("Permanent Address: ");
    String permanentAddress = stdin.readLineSync()!;

    stdout.write("Contact Number: ");
    String contact = stdin.readLineSync()!;

    stdout.write("Age: ");
    int age = int.parse(stdin.readLineSync()!);

    stdout.write("Height (in feet, example: 5.6): ");
    double height = double.parse(stdin.readLineSync()!);

    // storing each student as a map
    Map<String, dynamic> student = {
      "name": name,
      "details": details,
      "presentAddress": presentAddress,
      "permanentAddress": permanentAddress,
      "contact": contact,
      "age": age,
      "height": height,
    };

    // adding the student map into the list
    studentList.add(student);

    print("Student ${i + 1} info saved!");
  }

  //  showing all student information
  print("\n------------------------------------------------------");
  print("All 5 students information:");
  print("------------------------------------------------------");

  for (int i = 0; i < studentList.length; i++) {
    print("\nStudent ${i + 1}:");
    print("  Name: ${studentList[i]["name"]}");
    print("  About: ${studentList[i]["details"]}");
    print("  Present Address: ${studentList[i]["presentAddress"]}");
    print("  Permanent Address: ${studentList[i]["permanentAddress"]}");
    print("  Contact: ${studentList[i]["contact"]}");
    print("  Age: ${studentList[i]["age"]}");
    print("  Height: ${studentList[i]["height"]} feet");
  }


  // sort students by age (using bubble sort)
  print("\n------------------------------------------------------");
  print("Students sorted by age (youngest to oldest):");

  // making a copy so original list stays same
  List<Map<String, dynamic>> sortedList = List.from(studentList);

  for (int i = 0; i < sortedList.length; i++) {
    for (int j = 0; j < sortedList.length - i - 1; j++) {
      if (sortedList[j]["age"] > sortedList[j + 1]["age"]) { 
        // swap
        Map<String, dynamic> temp = sortedList[j];
        sortedList[j] = sortedList[j + 1];
        sortedList[j + 1] = temp;
      }
    }
  }

  for (int i = 0; i < sortedList.length; i++) {
    print("  ${i + 1}. ${sortedList[i]["name"]} - Age: ${sortedList[i]["age"]}");
  }

  // find the oldest student
  print("\n------------------------------------------------------");
  Map<String, dynamic> oldest = studentList[0];

  for (int i = 1; i < studentList.length; i++) {
    if (studentList[i]["age"] > oldest["age"]) {
      oldest = studentList[i];
    }
  }

  print("Oldest student is: ${oldest["name"]} with age ${oldest["age"]}");
}
