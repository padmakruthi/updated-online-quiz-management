<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.quiz.model.Question" %>
<%@ page import="com.quiz.model.QuizResult" %>
<%@ page import="com.quiz.service.QuizRepository" %>
<%
    List<Question> questions = (List<Question>) session.getAttribute("quizQuestions");
    String candidateName = (String) session.getAttribute("candidateName");
    String category = (String) session.getAttribute("quizCategory");
    Integer attemptNumber = (Integer) session.getAttribute("attemptNumber");
    Integer lastScore = (Integer) session.getAttribute("lastScore");
    Integer lastTotal = (Integer) session.getAttribute("lastTotal");

    if (questions == null || questions.isEmpty()) {
        questions = QuizRepository.getAllQuestions();
        session.setAttribute("quizQuestions", questions);
        if (candidateName == null) candidateName = "Student";
        if (category == null) category = "ALL";
        if (attemptNumber == null) attemptNumber = 1;
        session.setAttribute("candidateName", candidateName);
        session.setAttribute("quizCategory", category);
        session.setAttribute("attemptNumber", attemptNumber);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment in Progress - Java Packages</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript">
        var totalQuestions = <%= questions.size() %>;
        var currentIndex = 0;

        function updateProgress() {
            var pct = Math.round(((currentIndex + 1) / totalQuestions) * 100);
            document.getElementById("progressFill").style.width = pct + "%";
            document.getElementById("metaQuestionCounter").innerText = (currentIndex + 1) + " of " + totalQuestions;
        }

        function updatePalette() {
            var answeredCount = 0;
            for (var i = 0; i < totalQuestions; i++) {
                var btn = document.getElementById("palBtn_" + i);
                var slide = document.getElementById("qslide_" + i);
                var radios = slide.querySelectorAll("input[type='radio']");
                var isChecked = false;
                for (var r = 0; r < radios.length; r++) {
                    if (radios[r].checked) {
                        isChecked = true;
                        break;
                    }
                }

                if (btn) {
                    btn.classList.remove("active");
                    if (isChecked) {
                        btn.classList.add("answered");
                        answeredCount++;
                    } else {
                        btn.classList.remove("answered");
                    }
                    if (i === currentIndex) {
                        btn.classList.add("active");
                    }
                }
            }

            var countElem = document.getElementById("answeredCountText");
            if (countElem) countElem.innerText = answeredCount + " of " + totalQuestions + " Answered";
            var metaElem = document.getElementById("metaAnsweredCounter");
            if (metaElem) metaElem.innerText = answeredCount + " / " + totalQuestions;
            var submitBtnMeta = document.getElementById("submitBtnText");
            if (submitBtnMeta) submitBtnMeta.innerText = "Submit Assessment (" + answeredCount + "/" + totalQuestions + ")";
        }

        function showSlide(index) {
            if (index < 0 || index >= totalQuestions) return;
            currentIndex = index;

            for (var i = 0; i < totalQuestions; i++) {
                var slide = document.getElementById("qslide_" + i);
                if (slide) {
                    slide.style.display = (i === currentIndex) ? "block" : "none";
                }
            }

            // Update buttons
            var prevBtn = document.getElementById("btnPrev");
            var nextBtn = document.getElementById("btnNext");
            var finishBtn = document.getElementById("btnFinish");

            if (prevBtn) {
                prevBtn.disabled = (currentIndex === 0);
            }

            if (currentIndex === totalQuestions - 1) {
                if (nextBtn) nextBtn.style.display = "none";
                if (finishBtn) finishBtn.style.display = "inline-block";
            } else {
                if (nextBtn) nextBtn.style.display = "inline-block";
                if (finishBtn) finishBtn.style.display = "none";
            }

            updateProgress();
            updatePalette();
            window.scrollTo({ top: 120, behavior: 'smooth' });
        }

        function nextQuestion() {
            if (currentIndex < totalQuestions - 1) {
                showSlide(currentIndex + 1);
            }
        }

        function prevQuestion() {
            if (currentIndex > 0) {
                showSlide(currentIndex - 1);
            }
        }

        function jumpToQuestion(idx) {
            showSlide(idx);
        }

        function onOptionSelect(radio) {
            var card = radio.closest(".question-card");
            var labels = card.querySelectorAll(".option-item");
            labels.forEach(function(lbl) { lbl.classList.remove("selected"); });
            radio.closest(".option-item").classList.add("selected");
            updatePalette();
        }

        function clearRadio(groupName, cardId) {
            var radios = document.getElementsByName(groupName);
            for (var i = 0; i < radios.length; i++) {
                radios[i].checked = false;
            }
            var card = document.getElementById(cardId);
            if (card) {
                var labels = card.querySelectorAll(".option-item");
                labels.forEach(function(lbl) { lbl.classList.remove("selected"); });
            }
            updatePalette();
        }

        function confirmSubmit() {
            var answered = 0;
            for (var i = 0; i < totalQuestions; i++) {
                var slide = document.getElementById("qslide_" + i);
                var radios = slide.querySelectorAll("input[type='radio']");
                for (var r = 0; r < radios.length; r++) {
                    if (radios[r].checked) {
                        answered++;
                        break;
                    }
                }
            }
            var unanswered = totalQuestions - answered;
            var msg = "You have answered " + answered + " of " + totalQuestions + " questions.";
            if (unanswered > 0) {
                msg += "\nWarning: " + unanswered + " question(s) are still unanswered.";
            }
            msg += "\n\nAre you sure you want to finish and submit your answers?";
            return confirm(msg);
        }

        window.onload = function() {
            showSlide(0);
        };
    </script>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Online Quiz Assessment</h1>
        <p>Technical Assessment Portal - Java Packages</p>
    </div>

    <div class="meta-bar">
        <div class="meta-item">Candidate: <strong><%= candidateName %></strong></div>
        <div class="meta-item">Question: <strong id="metaQuestionCounter">1 of <%= questions.size() %></strong></div>
        <div class="meta-item">Answered: <strong id="metaAnsweredCounter">0 / <%= questions.size() %></strong></div>
        <div class="meta-item">Attempt: <strong>#<%= attemptNumber %></strong></div>
        <% if (lastScore != null && lastTotal != null) { %>
            <div class="meta-item" style="color: #744210;">Previous Marks: <strong><%= lastScore %> / <%= lastTotal %></strong></div>
        <% } %>
    </div>

    <!-- Progress Bar -->
    <div class="progress-container">
        <div class="progress-fill" id="progressFill" style="width: 4%;"></div>
    </div>

    <!-- Question Palette Jump Grid -->
    <div class="palette-wrapper">
        <div class="palette-header">
            <span>Question Navigator (Click number to jump):</span>
            <span id="answeredCountText">0 of <%= questions.size() %> Answered</span>
        </div>
        <div class="question-palette">
            <% for (int i = 0; i < questions.size(); i++) { %>
                <button type="button" class="palette-btn <%= (i == 0 ? "active" : "") %>" id="palBtn_<%= i %>" onclick="jumpToQuestion(<%= i %>)">
                    <%= i + 1 %>
                </button>
            <% } %>
        </div>
        <div class="palette-legend">
            <span class="legend-item"><span class="legend-dot current"></span> Current</span>
            <span class="legend-item"><span class="legend-dot answered"></span> Answered</span>
            <span class="legend-item"><span class="legend-dot unanswered"></span> Unanswered</span>
        </div>
    </div>

    <form action="submitQuiz.jsp" method="post" id="quizForm" onsubmit="return confirmSubmit();">
        <%
            for (int idx = 0; idx < questions.size(); idx++) {
                Question q = questions.get(idx);
                String inputName = "q_" + q.getId();
                String cardId = "qcard_" + q.getId();
        %>
            <div class="question-slide" id="qslide_<%= idx %>" style="display: <%= (idx == 0 ? "block" : "none") %>;">
                <div class="question-card" id="<%= cardId %>">
                    <div class="question-header">
                        <span class="question-number">Question <%= idx + 1 %> of <%= questions.size() %></span>
                        <span class="topic-badge"><%= q.getTopic() %></span>
                    </div>

                    <div class="question-text">
                        <%= q.getQuestionText() %>
                    </div>

                    <% if (q.getCodeSnippet() != null && !q.getCodeSnippet().trim().isEmpty()) { %>
                        <pre class="code-snippet"><%= q.getCodeSnippet() %></pre>
                    <% } %>

                    <div class="options-list">
                        <%
                            String[] opts = q.getOptions();
                            String[] letters = {"A", "B", "C", "D"};
                            for (int i = 0; i < opts.length; i++) {
                                String radioId = "q_" + q.getId() + "_opt_" + i;
                        %>
                            <label class="option-item" for="<%= radioId %>">
                                <input type="radio" id="<%= radioId %>" name="<%= inputName %>" value="<%= i %>" onchange="onOptionSelect(this)">
                                <span class="option-text">
                                    <span class="option-letter"><%= letters[i] %>.</span>
                                    <%= opts[i] %>
                                </span>
                            </label>
                        <% } %>
                    </div>

                    <div style="margin-top: 12px; display: flex; justify-content: space-between; align-items: center;">
                        <span class="clear-link" onclick="clearRadio('<%= inputName %>', '<%= cardId %>')">Clear selection for this question</span>
                        <span style="font-size: 12px; color: #718096;">Select an option, then click Next</span>
                    </div>
                </div>
            </div>
        <%
            }
        %>

        <!-- Navigation Controls -->
        <div class="quiz-nav-bar">
            <div class="quiz-nav-left">
                <button type="button" class="btn btn-outline" id="btnPrev" onclick="prevQuestion()" disabled>
                    &larr; Previous Question
                </button>
            </div>

            <div class="quiz-nav-right">
                <button type="button" class="btn btn-primary" id="btnNext" onclick="nextQuestion()">
                    Next Question &rarr;
                </button>

                <button type="submit" class="btn btn-primary" id="btnFinish" style="display: none; background-color: #2e7d32; border-color: #2e7d32;">
                    Finish & Submit Assessment &check;
                </button>

                <button type="submit" class="btn btn-secondary" id="submitBtnText">
                    Submit Assessment (0/<%= questions.size() %>)
                </button>

                <a href="index.jsp" class="btn btn-outline" onclick="return confirm('Exit quiz without submitting? Current progress will be lost.');">
                    Cancel
                </a>
            </div>
        </div>
    </form>

    <div class="footer">
        <p>Online Quiz Management System | Java Packages Technical Assessment</p>
    </div>
</div>

</body>
</html>
