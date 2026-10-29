-- =====================================================================
-- Online Quiz Management System - Database Setup Script
-- Database Name: online_quiz_db
-- Target: MySQL Server 8.0 / MySQL Workbench
-- Description: Creates the quiz database, tables, and inserts all 25
--              curated Java Packages assessment questions.
-- =====================================================================

-- 1. Create and select Database
CREATE DATABASE IF NOT EXISTS online_quiz_db;
USE online_quiz_db;

-- 2. Drop existing tables if re-running
DROP TABLE IF EXISTS quiz_results;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS candidates;

-- 3. Create Questions Table
CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_number INT NOT NULL,
    topic VARCHAR(100) NOT NULL DEFAULT 'Java Packages',
    question_text TEXT NOT NULL,
    code_snippet TEXT DEFAULT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL,
    explanation TEXT NOT NULL
);

-- 4. Create Candidates Table
CREATE TABLE candidates (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Create Quiz Results Table
CREATE TABLE quiz_results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_name VARCHAR(100) NOT NULL,
    module_name VARCHAR(100) NOT NULL DEFAULT 'Java Packages',
    score INT NOT NULL,
    total_questions INT NOT NULL DEFAULT 25,
    percentage DECIMAL(5,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    attempt_number INT NOT NULL DEFAULT 1,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Insert All 25 Java Packages Questions
INSERT INTO questions (question_number, topic, question_text, code_snippet, option_a, option_b, option_c, option_d, correct_option, explanation) VALUES
(1, 'Java Packages', 'What is a package in Java?', NULL,
 'A collection of variables only',
 'A collection of related classes, interfaces, and other types',
 'A type of loop',
 'A method inside a class',
 'B',
 'A package in Java is a namespace mechanism used to group and organize related classes, interfaces, enumerations, and annotations. It prevents naming conflicts and controls access.'),

(2, 'Java Packages', 'Which keyword is used to declare a package in Java?', NULL,
 'import',
 'include',
 'package',
 'class',
 'C',
 'The package keyword is placed at the top of a Java source file to define the package to which the file types belong.'),

(3, 'Java Packages', 'Where should the package declaration normally appear in a Java source file?', NULL,
 'After the class declaration',
 'As the first statement, before imports and type declarations',
 'Inside the main() method',
 'At the end of the file',
 'B',
 'The package declaration must be the very first non-comment statement in a Java source compilation unit, appearing before import statements and class definitions.'),

(4, 'Java Packages', 'Which package is imported automatically in every Java source file?', NULL,
 'java.util',
 'java.io',
 'java.lang',
 'java.net',
 'C',
 'The java.lang package provides classes fundamental to the Java language (such as Object, String, Math, System, and Thread) and is automatically imported into every Java program.'),

(5, 'Java Packages', 'Which keyword allows you to use classes from another package?', NULL,
 'package',
 'import',
 'extends',
 'implements',
 'B',
 'The import keyword makes public classes and interfaces from other packages available to be referenced by their simple names without writing the full package prefix every time.'),

(6, 'Java Packages', 'Which statement correctly imports the Scanner class?', NULL,
 'import java.util.Scanner;',
 'include java.util.Scanner;',
 'package java.util.Scanner;',
 'import Scanner.java.util;',
 'A',
 'The Scanner class is located inside the java.util package, so the correct import statement syntax is import java.util.Scanner;.'),

(7, 'Java Packages', 'What does the following statement do?', 'import java.util.*;',
 'Imports only the Scanner class',
 'Imports all packages in Java',
 'Makes types in java.util available by their simple names',
 'Creates a new package',
 'C',
 'import java.util.*; is an on-demand import declaration that makes all accessible public types directly declared within the java.util package available by their simple names.'),

(8, 'Java Packages', 'Which statement is correct about import java.util.*;?', NULL,
 'It imports subpackages of java.util automatically.',
 'It imports the accessible types directly within java.util, not its subpackages.',
 'It imports only interfaces.',
 'It imports only classes that have a main() method.',
 'B',
 'Wildcard imports in Java are not recursive. import java.util.*; only imports classes/interfaces directly inside java.util; it does not import subpackages such as java.util.concurrent or java.util.regex.'),

(9, 'Java Packages', 'Which of the following is a valid package name?', NULL,
 'my package',
 '123package',
 'com.college.student',
 'com-college',
 'C',
 'Package names must follow Java identifier rules separated by dots. Spaces, leading numbers, and hyphens are invalid identifiers.'),

(10, 'Java Packages', 'If a class belongs to the package college, which declaration is correct?', NULL,
 'import college;',
 'package college;',
 'class package college;',
 'include college;',
 'B',
 'To place a class inside the package college, the source file must declare package college; at the beginning of the file.'),

(11, 'Java Packages', 'Which access modifier allows a member to be accessed from any package, provided the class itself is accessible?', NULL,
 'private',
 'Default (package-private)',
 'protected',
 'public',
 'D',
 'The public access modifier grants unrestricted visibility to the member from any other class in any package, provided the containing class is also accessible.'),

(12, 'Java Packages', 'A class member with no access modifier is accessible from:', NULL,
 'Every package',
 'Only the same class',
 'Classes in the same package',
 'Only subclasses in other packages',
 'C',
 'If no access modifier is specified, default (package-private) access applies, restricting access exclusively to classes within the exact same package.'),

(13, 'Java Packages', 'Which access modifier restricts access to within the declaring class?', NULL,
 'public',
 'protected',
 'private',
 'Default',
 'C',
 'The private access modifier restricts access so that the member is only accessible within the body of the class that declares it.'),

(14, 'Java Packages', 'A protected member can be accessed outside its package by:', NULL,
 'Any unrelated class',
 'A subclass, subject to Java''s protected-access rules',
 'Only the main() method',
 'No class',
 'B',
 'A protected member is accessible within the same package, and outside its package only through inheritance by subclasses, subject to Java''s protected access rules.'),

(15, 'Java Packages', 'Two classes belong to the same package. Which statement is correct?', NULL,
 'They can access each other''s private members directly.',
 'They can access each other''s package-private members.',
 'They must always use import.',
 'They must be in the same source file.',
 'B',
 'Classes in the same package have package-level visibility with each other. They can freely access each other''s package-private (default), protected, and public members without import statements.'),

(16, 'Java Packages', 'Consider the following code. What happens?', 'package demo;\nimport java.util.Scanner;\n\npublic class Test {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n    }\n}',
 'Compilation error because the package is named demo',
 'Compilation error because Scanner cannot be imported',
 'The code compiles, assuming the file and directory are set up correctly',
 'Runtime error because all packages require inheritance',
 'C',
 'The code is completely valid Java syntax. When placed in a directory named demo matching its package declaration, it compiles and runs without error.'),

(17, 'Java Packages', 'If a class named Student belongs to package college, which is its fully qualified name?', NULL,
 'Student.college',
 'college.Student',
 'college/Student',
 'Student::college',
 'B',
 'The fully qualified name (FQN) of a type in Java is constructed by appending the class name to the package name with a period: college.Student.'),

(18, 'Java Packages', 'Which command can compile Student.java when it declares package college;, creating the package directory structure if needed?', NULL,
 'javac -d . Student.java',
 'java -d . Student.java',
 'import -d . Student.java',
 'package Student.java',
 'A',
 'javac -d <directory> Student.java directs the Java compiler to compile the class and automatically generate matching folder hierarchies (like college/Student.class) in the destination.'),

(19, 'Java Packages', 'Suppose college.Student contains a public static void main(String[] args) method. If its compiled class is in the appropriate directory structure, how can you run it from the classpath root?', NULL,
 'java Student',
 'java college.Student',
 'java package.Student',
 'javac college.Student',
 'B',
 'From the classpath root directory, the JVM requires the fully qualified name to locate and execute the class: java college.Student.'),

(20, 'Java Packages', 'Which statement about packages is true?', NULL,
 'Packages help organize related classes and avoid naming conflicts.',
 'Every class must explicitly import java.lang.',
 'A package can contain only one class.',
 'Packages cannot contain interfaces.',
 'A',
 'Packages solve two fundamental software development needs in Java: preventing naming collisions between types and providing structured, modular groupings with encapsulation boundaries.'),

(21, 'Java Packages', 'Can two different packages contain classes with the same simple name?', NULL,
 'No, Java prohibits this.',
 'Yes, if their fully qualified names differ.',
 'Only if both classes are abstract.',
 'Only if both classes have the same methods.',
 'B',
 'Yes! For example, Java includes both java.util.Date and java.sql.Date. They share the same simple name Date but reside in distinct packages, avoiding naming conflicts.'),

(22, 'Java Packages', 'Which is the correct way to use ArrayList without an import statement?', NULL,
 'ArrayList a = new ArrayList();',
 'java.util.ArrayList a = new java.util.ArrayList();',
 'package.ArrayList a = new package.ArrayList();',
 'import.ArrayList a = new import.ArrayList();',
 'B',
 'Without an import statement, any external type can be instantiated and referenced by providing its fully qualified name: java.util.ArrayList a = new java.util.ArrayList();.'),

(23, 'Java Packages', 'Can a Java source file contain multiple package declarations?', NULL,
 'Yes, one for every class',
 'Yes, if separated by imports',
 'No, a source file can have at most one package declaration',
 'Only when using interfaces',
 'C',
 'According to the Java Language Specification, a compilation unit (source file) can have at most one package declaration, positioned at the very beginning of the file.'),

(24, 'Java Packages', 'What is the relationship between a subpackage and its parent package? For example, java.util and java.util.concurrent.', NULL,
 'A subpackage automatically inherits all accessible types from its parent package.',
 'A subpackage is treated as a separate package.',
 'Both names refer to the same package.',
 'Subpackages cannot contain classes.',
 'B',
 'Subpackages in Java exist for hierarchical human convention only; the Java compiler treats java.util and java.util.concurrent as completely separate, unrelated packages with no inheritance of visibility.'),

(25, 'Java Packages', 'Which statement about the import statement is correct?', NULL,
 'It copies a class into the current package.',
 'It changes the package to which a class belongs.',
 'It allows a type to be referred to by its simple name, when unambiguous and accessible.',
 'It is mandatory for every class used in a program.',
 'C',
 'The import statement is a compile-time convenience allowing developers to refer to classes by their simple names instead of writing verbose fully qualified names. It does not copy bytecode or alter package memberships.');

-- Sample query to verify data
SELECT id, question_number, SUBSTRING(question_text, 1, 50) AS question_preview, correct_option FROM questions;
