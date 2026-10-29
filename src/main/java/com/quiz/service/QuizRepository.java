package com.quiz.service;

import com.quiz.model.Question;
import com.quiz.model.QuestionReview;
import com.quiz.model.QuizResult;
import com.quiz.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Repository containing questions on Java Packages.
 * Supports JDBC connection to MySQL database: java_question_bank (table: mcq_questions).
 */
public class QuizRepository {

    private static final List<Question> ALL_QUESTIONS = new ArrayList<Question>();

    static {
        // Fallback in-memory questions matching mcq_questions table
        ALL_QUESTIONS.add(new Question(1, "Java Packages", "What is a package in Java?", null,
            new String[]{"A collection of variables only", "A collection of related classes, interfaces, and other types", "A type of loop", "A method inside a class"},
            1, "A package in Java is a collection of related classes, interfaces, and other types that provides namespace management and access protection."));

        ALL_QUESTIONS.add(new Question(2, "Java Packages", "Which keyword is used to declare a package in Java?", null,
            new String[]{"import", "include", "package", "class"},
            2, "The 'package' keyword is used to declare the package to which the source file belongs."));

        ALL_QUESTIONS.add(new Question(3, "Java Packages", "Where should the package declaration normally appear?", null,
            new String[]{"After the class declaration", "Before imports and type declarations", "Inside main()", "At the end of the file"},
            1, "The package statement must appear before any imports and type declarations at the very beginning of the source file."));

        ALL_QUESTIONS.add(new Question(4, "Java Packages", "Which package is imported automatically?", null,
            new String[]{"java.util", "java.io", "java.lang", "java.net"},
            2, "The 'java.lang' package provides fundamental language classes and is automatically imported into every Java source file."));

        ALL_QUESTIONS.add(new Question(5, "Java Packages", "Which keyword allows you to use classes from another package?", null,
            new String[]{"package", "import", "extends", "implements"},
            1, "The 'import' keyword allows classes, interfaces, and static members from external packages to be used by simple name."));

        ALL_QUESTIONS.add(new Question(6, "Java Packages", "Which statement correctly imports Scanner?", null,
            new String[]{"import java.util.Scanner;", "include java.util.Scanner;", "package java.util.Scanner;", "import Scanner.java.util;"},
            0, "Scanner resides in java.util, imported using 'import java.util.Scanner;'."));

        ALL_QUESTIONS.add(new Question(7, "Java Packages", "What does import java.util.*; do?", "import java.util.*;",
            new String[]{"Imports only Scanner", "Imports all Java packages", "Makes types in java.util available by simple names", "Creates a package"},
            2, "'import java.util.*;' is an on-demand import declaration that makes types directly in java.util available by simple names."));

        ALL_QUESTIONS.add(new Question(8, "Java Packages", "What does import java.util.*; import?", null,
            new String[]{"Imports subpackages automatically", "Imports accessible types directly in java.util, not subpackages", "Imports only interfaces", "Imports only classes with main()"},
            1, "Wildcard imports in Java do not recursively import subpackages. It only imports accessible types directly in java.util."));

        ALL_QUESTIONS.add(new Question(9, "Java Packages", "Which is a valid package name?", null,
            new String[]{"my package", "123package", "com.college.student", "com-college"},
            2, "'com.college.student' follows standard Java identifier rules separated by dots."));

        ALL_QUESTIONS.add(new Question(10, "Java Packages", "Which declaration is correct for a class in college?", null,
            new String[]{"import college;", "package college;", "class package college;", "include college;"},
            1, "The statement 'package college;' specifies that the class belongs to package college."));

        ALL_QUESTIONS.add(new Question(11, "Java Packages", "Which access modifier allows access from any package if the class is accessible?", null,
            new String[]{"private", "Default", "protected", "public"},
            3, "'public' grants access to members from any package, as long as the containing class itself is accessible."));

        ALL_QUESTIONS.add(new Question(12, "Java Packages", "A member with no access modifier is accessible from:", null,
            new String[]{"Every package", "Only the same class", "Classes in the same package", "Only subclasses in other packages"},
            2, "Default (package-private) access restricts visibility strictly to classes in the same package."));

        ALL_QUESTIONS.add(new Question(13, "Java Packages", "Which modifier restricts access to the declaring class?", null,
            new String[]{"public", "protected", "private", "Default"},
            2, "'private' specifies that the member can only be accessed within the body of the class that declares it."));

        ALL_QUESTIONS.add(new Question(14, "Java Packages", "A protected member can be accessed outside its package by:", null,
            new String[]{"Any unrelated class", "A subclass subject to protected-access rules", "Only main()", "No class"},
            1, "'protected' allows access within the same package, and outside the package by subclasses subject to Java's protected-access rules."));

        ALL_QUESTIONS.add(new Question(15, "Java Packages", "Which statement is correct for two classes in the same package?", null,
            new String[]{"They can directly access each other private members", "They can access each other package-private members", "They must always import each other", "They must be in the same file"},
            1, "Classes in the same package share package-level visibility and can access each other's package-private members without import statements."));

        ALL_QUESTIONS.add(new Question(16, "Java Packages", "What happens when Test in package demo imports java.util.Scanner correctly?", "package demo;\nimport java.util.Scanner;\n\npublic class Test {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n    }\n}",
            new String[]{"Error because package is demo", "Error because Scanner cannot be imported", "It compiles if file and directory setup is correct", "Runtime error because packages require inheritance"},
            2, "The syntax and structure are completely valid. It compiles cleanly when the directory matches the package demo."));

        ALL_QUESTIONS.add(new Question(17, "Java Packages", "What is the fully qualified name of Student in package college?", null,
            new String[]{"Student.college", "college.Student", "college/Student", "Student::college"},
            1, "The fully qualified name prefix the package name before the class name separated by a dot: 'college.Student'."));

        ALL_QUESTIONS.add(new Question(18, "Java Packages", "Which command compiles Student.java with package college and creates output directories?", null,
            new String[]{"javac -d . Student.java", "java -d . Student.java", "import -d . Student.java", "package Student.java"},
            0, "'javac -d . Student.java' compiles the file and automatically creates the destination directory structure."));

        ALL_QUESTIONS.add(new Question(19, "Java Packages", "How do you run college.Student from the classpath root?", null,
            new String[]{"java Student", "java college.Student", "java package.Student", "javac college.Student"},
            1, "From the classpath root, Java requires the fully qualified name to run a class in a package: 'java college.Student'."));

        ALL_QUESTIONS.add(new Question(20, "Java Packages", "Which statement about packages is true?", null,
            new String[]{"They organize related classes and avoid naming conflicts", "Every class must import java.lang", "A package can contain only one class", "Packages cannot contain interfaces"},
            0, "Packages organize related classes and interfaces into modular namespaces and prevent naming collisions."));

        ALL_QUESTIONS.add(new Question(21, "Java Packages", "Can different packages contain classes with the same simple name?", null,
            new String[]{"No", "Yes, if their fully qualified names differ", "Only abstract classes", "Only classes with identical methods"},
            1, "Yes, distinct packages can contain classes with the same simple name because their fully qualified names are unique."));

        ALL_QUESTIONS.add(new Question(22, "Java Packages", "How can you use ArrayList without an import statement?", null,
            new String[]{"ArrayList a = new ArrayList();", "java.util.ArrayList a = new java.util.ArrayList();", "package.ArrayList a = new package.ArrayList();", "import.ArrayList a = new import.ArrayList();"},
            1, "Using the fully qualified name 'java.util.ArrayList' allows the class to be used directly without an import declaration."));

        ALL_QUESTIONS.add(new Question(23, "Java Packages", "Can a Java source file contain multiple package declarations?", null,
            new String[]{"Yes, one per class", "Yes, separated by imports", "No, at most one package declaration", "Only with interfaces"},
            2, "A Java compilation unit can contain at most one package declaration statement at the top of the file."));

        ALL_QUESTIONS.add(new Question(24, "Java Packages", "What is the relationship between java.util and java.util.concurrent?", null,
            new String[]{"A subpackage inherits parent types automatically", "A subpackage is a separate package", "Both names refer to the same package", "Subpackages cannot contain classes"},
            1, "In Java, subpackages are separate packages with no inheritance of visibility from the parent package."));

        ALL_QUESTIONS.add(new Question(25, "Java Packages", "Which statement about import is correct?", null,
            new String[]{"It copies a class into the current package", "It changes a class package", "It allows an accessible, unambiguous type to be referred to by simple name", "It is mandatory for every class"},
            2, "The import statement simply allows an accessible type to be referenced by its simple name instead of writing its fully qualified name."));
    }

    /**
     * Attempts to fetch questions from MySQL table `mcq_questions` via JDBC.
     */
    public static List<Question> fetchQuestionsFromDatabase() {
        List<Question> list = new ArrayList<Question>();
        String sql = "SELECT id, question, option_a, option_b, option_c, option_d, correct_answer, topic FROM mcq_questions ORDER BY id ASC";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String question = rs.getString("question");
                String optA = rs.getString("option_a");
                String optB = rs.getString("option_b");
                String optC = rs.getString("option_c");
                String optD = rs.getString("option_d");
                String correctAns = rs.getString("correct_answer");
                String topic = rs.getString("topic");

                int correctOpt = 1;
                if (correctAns != null && !correctAns.trim().isEmpty()) {
                    char ch = Character.toUpperCase(correctAns.trim().charAt(0));
                    if (ch == 'A') correctOpt = 0;
                    else if (ch == 'B') correctOpt = 1;
                    else if (ch == 'C') correctOpt = 2;
                    else if (ch == 'D') correctOpt = 3;
                }

                String codeSnippet = null;
                if (id == 7) codeSnippet = "import java.util.*;";
                if (id == 16) codeSnippet = "package demo;\nimport java.util.Scanner;\n\npublic class Test {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n    }\n}";

                list.add(new Question(
                    id,
                    topic != null ? topic : "Java Packages",
                    question,
                    codeSnippet,
                    new String[]{optA, optB, optC, optD},
                    correctOpt,
                    getExplanation(id)
                ));
            }

            if (!list.isEmpty()) {
                System.out.println("[JDBC] Successfully loaded " + list.size() + " questions from MySQL database `java_question_bank.mcq_questions`!");
                return list;
            }
        } catch (Exception e) {
            System.err.println("[JDBC Notice] Failed fetching from MySQL (" + e.getMessage() + "). Using in-memory questions.");
        }
        return null;
    }

    private static String getExplanation(int id) {
        if (id >= 1 && id <= ALL_QUESTIONS.size()) {
            return ALL_QUESTIONS.get(id - 1).getExplanation();
        }
        return "Java packages provide modular namespaces and access protection.";
    }

    /**
     * Return all 25 questions, fetching from JDBC database if available.
     */
    public static List<Question> getAllQuestions() {
        List<Question> dbQuestions = fetchQuestionsFromDatabase();
        if (dbQuestions != null && !dbQuestions.isEmpty()) {
            return dbQuestions;
        }
        return new ArrayList<Question>(ALL_QUESTIONS);
    }

    /**
     * Get questions based on category filter.
     */
    public static List<Question> getQuestionsByCategory(String category) {
        return getAllQuestions();
    }

    /**
     * Evaluate submitted answers and produce a QuizResult.
     */
    public static QuizResult evaluateQuiz(String candidateName, String category, 
                                         List<Question> questions, 
                                         Map<Integer, Integer> submittedAnswers,
                                         Integer previousScore, Integer previousTotal, int attemptNumber) {
        QuizResult result = new QuizResult();
        result.setCandidateName((candidateName == null || candidateName.trim().isEmpty()) ? "Student" : candidateName.trim());
        result.setCategory(category != null ? category : "Java Packages");
        result.setTotalQuestions(questions.size());
        result.setPreviousScore(previousScore);
        result.setPreviousTotal(previousTotal);
        result.setAttemptNumber(attemptNumber);

        int correctCount = 0;
        int wrongCount = 0;
        int unattemptedCount = 0;

        for (Question q : questions) {
            Integer userChoice = submittedAnswers.get(q.getId());
            boolean isAttempted = (userChoice != null && userChoice >= 0 && userChoice <= 3);

            if (!isAttempted) {
                unattemptedCount++;
                result.addReview(new QuestionReview(q, -1, false));
            } else if (userChoice == q.getCorrectOption()) {
                correctCount++;
                result.addReview(new QuestionReview(q, userChoice, true));
            } else {
                wrongCount++;
                result.addReview(new QuestionReview(q, userChoice, false));
            }
        }

        result.setCorrectCount(correctCount);
        result.setWrongCount(wrongCount);
        result.setUnattemptedCount(unattemptedCount);
        result.setScore(correctCount);

        double percentage = (questions.isEmpty()) ? 0.0 : ((double) correctCount / questions.size()) * 100.0;
        result.setPercentage(Math.round(percentage * 10.0) / 10.0);

        if (percentage >= 60.0) {
            result.setStatus("PASSED");
        } else {
            result.setStatus("NEEDS IMPROVEMENT");
        }

        return result;
    }
}
