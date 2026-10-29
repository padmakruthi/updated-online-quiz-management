<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.QuizResult" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Java Packages Assessment</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Online Quiz System</h1>
        <p>Technical Assessment Portal - Java Packages & Namespace Management</p>
    </div>

    <%
        // Check if there is a previous quiz attempt recorded in the session
        QuizResult lastResult = (QuizResult) session.getAttribute("lastResult");
        String savedCandidateName = (String) session.getAttribute("candidateName");
        if (savedCandidateName == null && lastResult != null) {
            savedCandidateName = lastResult.getCandidateName();
        }
        if (savedCandidateName == null) {
            savedCandidateName = "";
        }
    %>

    <% if (lastResult != null) { %>
        <div class="banner banner-previous">
            <div class="banner-title">Previous Assessment Record Found</div>
            <p>
                Candidate: <strong><%= lastResult.getCandidateName() %></strong> | 
                Category: <strong><%= lastResult.getCategory() %></strong> | 
                Last Marks: <strong><%= lastResult.getScore() %> / <%= lastResult.getTotalQuestions() %></strong> 
                (<%= lastResult.getPercentage() %>%) - 
                <strong>[ <%= lastResult.getStatus() %> ]</strong>
            </p>
            <p style="margin-top: 6px; font-size: 13px;">
                You can retry the assessment below to improve your score.
            </p>
        </div>
    <% } %>

    <div class="banner banner-info">
        <div class="banner-title">Assessment Guidelines</div>
        <p>- Contains <strong>25 Multiple Choice Questions</strong> on Java Packages, Import declarations, Access Modifiers, and Compilation/Execution.</p>
        <p>- <strong>One question is presented at a time</strong>. Click <strong>Next</strong> to proceed or <strong>Previous</strong> to review.</p>
        <p>- You can jump to any question directly using the question palette numbers.</p>
        <p>- Each question carries 1 mark with no negative marking. Passing score is 60% (15/25).</p>
    </div>

    <form action="startQuiz.jsp" method="post">
        <div class="form-group">
            <label for="candidateName">Candidate Full Name:</label>
            <input type="text" id="candidateName" name="candidateName" class="form-control" 
                   value="<%= savedCandidateName %>" placeholder="Enter your full name" required autofocus>
        </div>

        <div class="form-group">
            <label for="category">Select Assessment Scope:</label>
            <select id="category" name="category" class="form-control">
                <option value="ALL">Complete Assessment (All 25 Questions on Java Packages)</option>
                <option value="BASICS">Package Fundamentals & Imports (Questions 1 - 10)</option>
                <option value="MODIFIERS">Access Modifiers & Visibility (Questions 11 - 15)</option>
                <option value="EXECUTION">Compilation, Classpath & Subpackages (Questions 16 - 25)</option>
            </select>
        </div>

        <div style="margin-top: 25px;">
            <button type="submit" class="btn btn-primary btn-block">Start Assessment</button>
        </div>
    </form>

    <div class="footer">
        <p>Online Quiz Management System | Running on Apache Tomcat & Eclipse Dynamic Web Module</p>
    </div>
</div>

</body>
</html>
