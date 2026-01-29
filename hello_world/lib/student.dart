class Student {
  String _name = ''; // private
  int age = -1;
  int grade = -1;

  // Student();  // unnamed constructor

  Student(this._name, this.age, this.grade); // unnamed constructor

  Student.withName(this._name): age = 18, grade = 10; // initialize phase

  // Getter
  String get name => _name;
  // Setter
  set name(String name) {
    _name = name;
  }

  void displayInfo() {
    print("Hello, I am $_name, $age years old");
  }
}