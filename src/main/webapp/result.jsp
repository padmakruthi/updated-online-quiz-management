<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.quiz.model.Question" %>
<%@ page import="com.quiz.model.QuestionReview" %>
<%@ page import="com.quiz.model.QuizResult" %>
<%
    QuizResult result = (QuizResult) session.getAttribute("currentResult");
    if (result == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment Results - Java Packages</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Assessment Report</h1>
        <p>Technical Assessment Portal - Java Packages</p>
    </div>

    <div class="meta-bar">
        <div class="meta-item">Candidate: <strong><%= result.getCandidateName() %></strong></div>
        <div class="meta-item">Module: <strong><%= result.getCategory() %></strong></div>
        <div class="meta-item">Attempt: <strong>#<%= result.getAttemptNumber() %></strong></div>
    </div>

    <!-- Final Score Display -->
    <div class="score-card">
        <div style="font-size: 14px; text-transform: uppercase; color: #718096; font-weight: 700; letter-spacing: 0.5px;">
            Final Score
        </div>
        <div class="score-display">
            <%= result.getScore() %> / <%= result.getTotalQuestions() %>
        </div>
        <div class="percentage-display">
            Percentage: <strong><%= result.getPercentage() %>%</strong>
        </div>

        <div>
            <% if ("PASSED".equalsIgnoreCase(result.getStatus())) { %>
                <span class="status-badge status-passed">[ PASSED - QUALIFIED ]</span>
            <% } else { %>
                <span class="status-badge status-failed">[ NEEDS IMPROVEMENT - RETRY RECOMMENDED ]</span>
            <% } %>
        </div>

        <!-- Last Marks Comparison (if candidate retried the quiz) -->
        <% if (result.hasPreviousAttempt()) { %>
            <div class="comparison-box">
                <h4>Score Comparison with Last Attempt:</h4>
                <p>
                    Previous Attempt Marks: <strong><%= result.getPreviousScore() %> / <%= result.getPreviousTotal() %></strong> 
                    (<%= Math.round(((double)result.getPreviousScore() / result.getPreviousTotal()) * 100.0) %>%)
                </p>
                <p>
                    Current Attempt Marks: <strong><%= result.getScore() %> / <%= result.getTotalQuestions() %></strong> 
                    (<%= result.getPercentage() %>%)
                </p>
                <p style="margin-top: 6px;">
                    <%
                        int diff = result.getScoreDifference();
                        if (diff > 0) {
                    %>
                        Score Difference: <strong style="color: #22543d;">+<%= diff %> marks (Improvement achieved!)</strong>
                    <% } else if (diff < 0) { %>
                        Score Difference: <strong style="color: #742a2a;"><%= diff %> marks</strong>
                    <% } else { %>
                        Score Difference: <strong>0 marks (Consistent score)</strong>
                    <% } %>
                </p>
            </div>
        <% } %>
    </div>

    <!-- Performance Statistics -->
    <div class="stats-grid">
        <div class="stat-box">
            <div class="stat-label">Correct Answers</div>
            <div class="stat-value" style="color: #2e7d32;"><%= result.getCorrectCount() %></div>
        </div>
        <div class="stat-box">
            <div class="stat-label">Incorrect Answers</div>
            <div class="stat-value" style="color: #c62828;"><%= result.getWrongCount() %></div>
        </div>
        <div class="stat-box">
            <div class="stat-label">Unattempted</div>
            <div class="stat-value" style="color: #616161;"><%= result.getUnattemptedCount() %></div>
        </div>
    </div>

    <!-- Action Buttons: Retry Option & Back Home -->
    <div class="btn-group" style="margin-bottom: 30px;">
        <a href="retry.jsp" class="btn btn-primary" style="flex: 2; font-size: 15px; padding: 12px 20px;">
            Retry Quiz (Retake with Previous Marks Saved)
        </a>
        <a href="index.jsp" class="btn btn-secondary" style="flex: 1; font-size: 15px; padding: 12px 20px;">
            Back to Home / Change Subject
        </a>
    </div>

    <!-- Detailed Review & Explanation Section -->
    <div style="margin-top: 30px;">
        <h3 style="font-size: 18px; margin-bottom: 15px; border-bottom: 2px solid #e2e8f0; padding-bottom: 8px;">
            Detailed Answer Key & Concept Explanations
        </h3>

        <%
            List<QuestionReview> reviews = result.getReviews();
            int revIndex = 1;
            for (QuestionReview rev : reviews) {
                Question q = rev.getQuestion();
                String cardClass = "review-card ";
                String tagClass = "review-tag ";
                String statusLabel = "";

                if (!rev.isAttempted()) {
                    cardClass += "review-unattempted";
                    tagClass += "tag-unattempted";
                    statusLabel = "[ Not Attempted ]";
                } else if (rev.isCorrect()) {
                    cardClass += "review-correct";
                    tagClass += "tag-correct";
                    statusLabel = "[ Correct ]";
                } else {
                    cardClass += "review-wrong";
                    tagClass += "tag-wrong";
                    statusLabel = "[ Incorrect ]";
                }
        %>
            <div class="<%= cardClass %>">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
                    <span style="font-size: 13px; font-weight: 700; color: #4a5568;">Question <%= revIndex %> (<%= q.getTopic() %>)</span>
                    <span class="<%= tagClass %>"><%= statusLabel %></span>
                </div>

                <div style="font-weight: 600; font-size: 15px; margin-bottom: 10px; color: #1a202c;">
                    <%= q.getQuestionText() %>
                </div>

                <% if (q.getCodeSnippet() != null && !q.getCodeSnippet().trim().isEmpty()) { %>
                    <pre class="code-snippet"><%= q.getCodeSnippet() %></pre>
                <% } %>

                <div class="review-answer-line">
                    Your Selection: 
                    <strong>
                        <% if (!rev.isAttempted()) { %>
                            <span style="color: #718096;">None (Question skipped)</span>
                        <% } else { %>
                            <span style="color: <%= rev.isCorrect() ? "#22543d" : "#742a2a" %>;">
                                <%= rev.getSelectedOptionLetter() %>. <%= rev.getSelectedOptionText() %>
                            </span>
                        <% } %>
                    </strong>
                </div>

                <div class="review-answer-line">
                    Correct Answer: 
                    <strong style="color: #22543d;">
                        <%= q.getCorrectOptionLetter() %>. <%= rev.getCorrectOptionText() %>
                    </strong>
                </div>

                <div class="review-explanation">
                    <strong>Explanation:</strong> <%= q.getExplanation() %>
                </div>
            </div>
        <%
                revIndex++;
            }
        %>
    </div>

    <!-- Bottom Action Group for Convenience -->
    <div class="btn-group" style="margin-top: 25px;">
        <a href="retry.jsp" class="btn btn-primary" style="flex: 2;">
            Retry Quiz
        </a>
        <a href="index.jsp" class="btn btn-outline" style="flex: 1;">
            Back to Home
        </a>
    </div>

    <div class="footer">
        <p>Online Quiz Management System | Java Full Stack & DevOps Assessment</p>
    </div>
</div>

</body>
</html>
