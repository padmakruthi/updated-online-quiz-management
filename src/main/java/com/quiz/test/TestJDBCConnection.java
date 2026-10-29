package com.quiz.test;

import com.quiz.model.Question;
import com.quiz.service.QuizRepository;
import com.quiz.util.DBUtil;

import java.sql.Connection;
import java.util.List;

/**
 * Run this directly in Eclipse (Right Click -> Run As -> Java Application)
 * to verify JDBC connection and print questions loaded from MySQL `java_question_bank`.
 */
public class TestJDBCConnection {

    public static void main(String[] args) {
        System.out.println("==================================================");
        System.out.println("Testing JDBC Connection to MySQL (java_question_bank)...");
        System.out.println("==================================================");

        try (Connection conn = DBUtil.getConnection()) {
            System.out.println("SUCCESS: Connected to MySQL database!");
            System.out.println("Database Product Name: " + conn.getMetaData().getDatabaseProductName());
            System.out.println("Database Version     : " + conn.getMetaData().getDatabaseProductVersion());
            System.out.println("Driver Version       : " + conn.getMetaData().getDriverVersion());
            System.out.println("--------------------------------------------------");

            List<Question> questions = QuizRepository.fetchQuestionsFromDatabase();
            if (questions != null && !questions.isEmpty()) {
                System.out.println("Retrieved " + questions.size() + " questions from `mcq_questions` table:\n");
                for (Question q : questions) {
                    System.out.printf("Q%d: %s [Ans: %s]\n", q.getId(), q.getQuestionText(), q.getCorrectOptionLetter());
                    String[] opts = q.getOptions();
                    System.out.println("   A. " + opts[0]);
                    System.out.println("   B. " + opts[1]);
                    System.out.println("   C. " + opts[2]);
                    System.out.println("   D. " + opts[3]);
                    System.out.println();
                }
                System.out.println("==================================================");
                System.out.println("ALL 25 QUESTIONS LOADED SUCCESSFULLY VIA JDBC!");
                System.out.println("==================================================");
            } else {
                System.err.println("No questions returned from mcq_questions table.");
            }

        } catch (Exception e) {
            System.err.println("JDBC Connection Failed: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
