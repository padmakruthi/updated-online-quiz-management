-- ==========================================================
-- Database: java_question_bank
-- Table: mcq_questions
-- ==========================================================

CREATE DATABASE IF NOT EXISTS java_question_bank;
USE java_question_bank;

DROP TABLE IF EXISTS mcq_questions;

CREATE TABLE mcq_questions (
    id INT PRIMARY KEY,
    question TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_answer CHAR(1) NOT NULL,
    topic VARCHAR(100) DEFAULT 'Java Packages',
    CHECK (correct_answer IN ('A', 'B', 'C', 'D'))
);

INSERT INTO mcq_questions (id, question, option_a, option_b, option_c, option_d, correct_answer, topic) VALUES
(1, 'What is a package in Java?', 'A collection of variables only', 'A collection of related classes, interfaces, and other types', 'A type of loop', 'A method inside a class', 'B', 'Java Packages'),
(2, 'Which keyword is used to declare a package in Java?', 'import', 'include', 'package', 'class', 'C', 'Java Packages'),
(3, 'Where should the package declaration normally appear?', 'After the class declaration', 'Before imports and type declarations', 'Inside main()', 'At the end of the file', 'B', 'Java Packages'),
(4, 'Which package is imported automatically?', 'java.util', 'java.io', 'java.lang', 'java.net', 'C', 'Java Packages'),
(5, 'Which keyword allows you to use classes from another package?', 'package', 'import', 'extends', 'implements', 'B', 'Java Packages'),
(6, 'Which statement correctly imports Scanner?', 'import java.util.Scanner;', 'include java.util.Scanner;', 'package java.util.Scanner;', 'import Scanner.java.util;', 'A', 'Java Packages'),
(7, 'What does import java.util.*; do?', 'Imports only Scanner', 'Imports all Java packages', 'Makes types in java.util available by simple names', 'Creates a package', 'C', 'Java Packages'),
(8, 'What does import java.util.*; import?', 'Imports subpackages automatically', 'Imports accessible types directly in java.util, not subpackages', 'Imports only interfaces', 'Imports only classes with main()', 'B', 'Java Packages'),
(9, 'Which is a valid package name?', 'my package', '123package', 'com.college.student', 'com-college', 'C', 'Java Packages'),
(10, 'Which declaration is correct for a class in college?', 'import college;', 'package college;', 'class package college;', 'include college;', 'B', 'Java Packages'),
(11, 'Which access modifier allows access from any package if the class is accessible?', 'private', 'Default', 'protected', 'public', 'D', 'Java Packages'),
(12, 'A member with no access modifier is accessible from:', 'Every package', 'Only the same class', 'Classes in the same package', 'Only subclasses in other packages', 'C', 'Java Packages'),
(13, 'Which modifier restricts access to the declaring class?', 'public', 'protected', 'private', 'Default', 'C', 'Java Packages'),
(14, 'A protected member can be accessed outside its package by:', 'Any unrelated class', 'A subclass subject to protected-access rules', 'Only main()', 'No class', 'B', 'Java Packages'),
(15, 'Which statement is correct for two classes in the same package?', 'They can directly access each other private members', 'They can access each other package-private members', 'They must always import each other', 'They must be in the same file', 'B', 'Java Packages'),
(16, 'What happens when Test in package demo imports java.util.Scanner correctly?', 'Error because package is demo', 'Error because Scanner cannot be imported', 'It compiles if file and directory setup is correct', 'Runtime error because packages require inheritance', 'C', 'Java Packages'),
(17, 'What is the fully qualified name of Student in package college?', 'Student.college', 'college.Student', 'college/Student', 'Student::college', 'B', 'Java Packages'),
(18, 'Which command compiles Student.java with package college and creates output directories?', 'javac -d . Student.java', 'java -d . Student.java', 'import -d . Student.java', 'package Student.java', 'A', 'Java Packages'),
(19, 'How do you run college.Student from the classpath root?', 'java Student', 'java college.Student', 'java package.Student', 'javac college.Student', 'B', 'Java Packages'),
(20, 'Which statement about packages is true?', 'They organize related classes and avoid naming conflicts', 'Every class must import java.lang', 'A package can contain only one class', 'Packages cannot contain interfaces', 'A', 'Java Packages'),
(21, 'Can different packages contain classes with the same simple name?', 'No', 'Yes, if their fully qualified names differ', 'Only abstract classes', 'Only classes with identical methods', 'B', 'Java Packages'),
(22, 'How can you use ArrayList without an import statement?', 'ArrayList a = new ArrayList();', 'java.util.ArrayList a = new java.util.ArrayList();', 'package.ArrayList a = new package.ArrayList();', 'import.ArrayList a = new import.ArrayList();', 'B', 'Java Packages'),
(23, 'Can a Java source file contain multiple package declarations?', 'Yes, one per class', 'Yes, separated by imports', 'No, at most one package declaration', 'Only with interfaces', 'C', 'Java Packages'),
(24, 'What is the relationship between java.util and java.util.concurrent?', 'A subpackage inherits parent types automatically', 'A subpackage is a separate package', 'Both names refer to the same package', 'Subpackages cannot contain classes', 'B', 'Java Packages'),
(25, 'Which statement about import is correct?', 'It copies a class into the current package', 'It changes a class package', 'It allows an accessible, unambiguous type to be referred to by simple name', 'It is mandatory for every class', 'C', 'Java Packages');

-- Verify data
SELECT * FROM mcq_questions;
