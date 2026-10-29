// Online Quiz Management - Client-side engine for Java Packages Assessment
// Single-question step-by-step navigation (Next / Previous / Palette Jump)
// Synced with Database: java_question_bank (Table: mcq_questions)

const ALL_QUESTIONS = [
    {
        id: 1,
        topic: "Java Packages",
        questionText: "What is a package in Java?",
        codeSnippet: null,
        options: [
            "A collection of variables only",
            "A collection of related classes, interfaces, and other types",
            "A type of loop",
            "A method inside a class"
        ],
        correctOption: 1, // B
        explanation: "A package in Java is a collection of related classes, interfaces, and other types that provides namespace management and access protection."
    },
    {
        id: 2,
        topic: "Java Packages",
        questionText: "Which keyword is used to declare a package in Java?",
        codeSnippet: null,
        options: [
            "import",
            "include",
            "package",
            "class"
        ],
        correctOption: 2, // C
        explanation: "The 'package' keyword is used to declare the package to which the source file belongs."
    },
    {
        id: 3,
        topic: "Java Packages",
        questionText: "Where should the package declaration normally appear?",
        codeSnippet: null,
        options: [
            "After the class declaration",
            "Before imports and type declarations",
            "Inside main()",
            "At the end of the file"
        ],
        correctOption: 1, // B
        explanation: "The package statement must appear before any imports and type declarations at the very beginning of the source file."
    },
    {
        id: 4,
        topic: "Java Packages",
        questionText: "Which package is imported automatically?",
        codeSnippet: null,
        options: [
            "java.util",
            "java.io",
            "java.lang",
            "java.net"
        ],
        correctOption: 2, // C
        explanation: "The 'java.lang' package provides fundamental language classes and is automatically imported into every Java source file."
    },
    {
        id: 5,
        topic: "Java Packages",
        questionText: "Which keyword allows you to use classes from another package?",
        codeSnippet: null,
        options: [
            "package",
            "import",
            "extends",
            "implements"
        ],
        correctOption: 1, // B
        explanation: "The 'import' keyword allows classes, interfaces, and static members from external packages to be used by simple name."
    },
    {
        id: 6,
        topic: "Java Packages",
        questionText: "Which statement correctly imports Scanner?",
        codeSnippet: null,
        options: [
            "import java.util.Scanner;",
            "include java.util.Scanner;",
            "package java.util.Scanner;",
            "import Scanner.java.util;"
        ],
        correctOption: 0, // A
        explanation: "Scanner resides in java.util, imported using 'import java.util.Scanner;'."
    },
    {
        id: 7,
        topic: "Java Packages",
        questionText: "What does import java.util.*; do?",
        codeSnippet: "import java.util.*;",
        options: [
            "Imports only Scanner",
            "Imports all Java packages",
            "Makes types in java.util available by simple names",
            "Creates a package"
        ],
        correctOption: 2, // C
        explanation: "'import java.util.*;' is an on-demand import declaration that makes types directly in java.util available by simple names."
    },
    {
        id: 8,
        topic: "Java Packages",
        questionText: "What does import java.util.*; import?",
        codeSnippet: null,
        options: [
            "Imports subpackages automatically",
            "Imports accessible types directly in java.util, not subpackages",
            "Imports only interfaces",
            "Imports only classes with main()"
        ],
        correctOption: 1, // B
        explanation: "Wildcard imports in Java do not recursively import subpackages. It only imports accessible types directly in java.util."
    },
    {
        id: 9,
        topic: "Java Packages",
        questionText: "Which is a valid package name?",
        codeSnippet: null,
        options: [
            "my package",
            "123package",
            "com.college.student",
            "com-college"
        ],
        correctOption: 2, // C
        explanation: "'com.college.student' follows standard Java identifier rules separated by dots."
    },
    {
        id: 10,
        topic: "Java Packages",
        questionText: "Which declaration is correct for a class in college?",
        codeSnippet: null,
        options: [
            "import college;",
            "package college;",
            "class package college;",
            "include college;"
        ],
        correctOption: 1, // B
        explanation: "The statement 'package college;' specifies that the class belongs to package college."
    },
    {
        id: 11,
        topic: "Java Packages",
        questionText: "Which access modifier allows access from any package if the class is accessible?",
        codeSnippet: null,
        options: [
            "private",
            "Default",
            "protected",
            "public"
        ],
        correctOption: 3, // D
        explanation: "'public' grants access to members from any package, as long as the containing class itself is accessible."
    },
    {
        id: 12,
        topic: "Java Packages",
        questionText: "A member with no access modifier is accessible from:",
        codeSnippet: null,
        options: [
            "Every package",
            "Only the same class",
            "Classes in the same package",
            "Only subclasses in other packages"
        ],
        correctOption: 2, // C
        explanation: "Default (package-private) access restricts visibility strictly to classes in the same package."
    },
    {
        id: 13,
        topic: "Java Packages",
        questionText: "Which modifier restricts access to the declaring class?",
        codeSnippet: null,
        options: [
            "public",
            "protected",
            "private",
            "Default"
        ],
        correctOption: 2, // C
        explanation: "'private' specifies that the member can only be accessed within the body of the class that declares it."
    },
    {
        id: 14,
        topic: "Java Packages",
        questionText: "A protected member can be accessed outside its package by:",
        codeSnippet: null,
        options: [
            "Any unrelated class",
            "A subclass subject to protected-access rules",
            "Only main()",
            "No class"
        ],
        correctOption: 1, // B
        explanation: "'protected' allows access within the same package, and outside the package by subclasses subject to Java's protected-access rules."
    },
    {
        id: 15,
        topic: "Java Packages",
        questionText: "Which statement is correct for two classes in the same package?",
        codeSnippet: null,
        options: [
            "They can directly access each other private members",
            "They can access each other package-private members",
            "They must always import each other",
            "They must be in the same file"
        ],
        correctOption: 1, // B
        explanation: "Classes in the same package share package-level visibility and can access each other's package-private members without import statements."
    },
    {
        id: 16,
        topic: "Java Packages",
        questionText: "What happens when Test in package demo imports java.util.Scanner correctly?",
        codeSnippet: "package demo;\nimport java.util.Scanner;\n\npublic class Test {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n    }\n}",
        options: [
            "Error because package is demo",
            "Error because Scanner cannot be imported",
            "It compiles if file and directory setup is correct",
            "Runtime error because packages require inheritance"
        ],
        correctOption: 2, // C
        explanation: "The syntax and structure are completely valid. It compiles cleanly when the directory matches the package demo."
    },
    {
        id: 17,
        topic: "Java Packages",
        questionText: "What is the fully qualified name of Student in package college?",
        codeSnippet: null,
        options: [
            "Student.college",
            "college.Student",
            "college/Student",
            "Student::college"
        ],
        correctOption: 1, // B
        explanation: "The fully qualified name prefix the package name before the class name separated by a dot: 'college.Student'."
    },
    {
        id: 18,
        topic: "Java Packages",
        questionText: "Which command compiles Student.java with package college and creates output directories?",
        codeSnippet: null,
        options: [
            "javac -d . Student.java",
            "java -d . Student.java",
            "import -d . Student.java",
            "package Student.java"
        ],
        correctOption: 0, // A
        explanation: "'javac -d . Student.java' compiles the file and automatically creates the destination directory structure."
    },
    {
        id: 19,
        topic: "Java Packages",
        questionText: "How do you run college.Student from the classpath root?",
        codeSnippet: null,
        options: [
            "java Student",
            "java college.Student",
            "java package.Student",
            "javac college.Student"
        ],
        correctOption: 1, // B
        explanation: "From the classpath root, Java requires the fully qualified name to run a class in a package: 'java college.Student'."
    },
    {
        id: 20,
        topic: "Java Packages",
        questionText: "Which statement about packages is true?",
        codeSnippet: null,
        options: [
            "They organize related classes and avoid naming conflicts",
            "Every class must import java.lang",
            "A package can contain only one class",
            "Packages cannot contain interfaces"
        ],
        correctOption: 0, // A
        explanation: "Packages organize related classes and interfaces into modular namespaces and prevent naming collisions."
    },
    {
        id: 21,
        topic: "Java Packages",
        questionText: "Can different packages contain classes with the same simple name?",
        codeSnippet: null,
        options: [
            "No",
            "Yes, if their fully qualified names differ",
            "Only abstract classes",
            "Only classes with identical methods"
        ],
        correctOption: 1, // B
        explanation: "Yes, distinct packages can contain classes with the same simple name because their fully qualified names are unique."
    },
    {
        id: 22,
        topic: "Java Packages",
        questionText: "How can you use ArrayList without an import statement?",
        codeSnippet: null,
        options: [
            "ArrayList a = new ArrayList();",
            "java.util.ArrayList a = new java.util.ArrayList();",
            "package.ArrayList a = new package.ArrayList();",
            "import.ArrayList a = new import.ArrayList();"
        ],
        correctOption: 1, // B
        explanation: "Using the fully qualified name 'java.util.ArrayList' allows the class to be used directly without an import declaration."
    },
    {
        id: 23,
        topic: "Java Packages",
        questionText: "Can a Java source file contain multiple package declarations?",
        codeSnippet: null,
        options: [
            "Yes, one per class",
            "Yes, separated by imports",
            "No, at most one package declaration",
            "Only with interfaces"
        ],
        correctOption: 2, // C
        explanation: "A Java compilation unit can contain at most one package declaration statement at the top of the file."
    },
    {
        id: 24,
        topic: "Java Packages",
        questionText: "What is the relationship between java.util and java.util.concurrent?",
        codeSnippet: null,
        options: [
            "A subpackage inherits parent types automatically",
            "A subpackage is a separate package",
            "Both names refer to the same package",
            "Subpackages cannot contain classes"
        ],
        correctOption: 1, // B
        explanation: "In Java, subpackages are separate packages with no inheritance of visibility from the parent package."
    },
    {
        id: 25,
        topic: "Java Packages",
        questionText: "Which statement about import is correct?",
        codeSnippet: null,
        options: [
            "It copies a class into the current package",
            "It changes a class package",
            "It allows an accessible, unambiguous type to be referred to by simple name",
            "It is mandatory for every class"
        ],
        correctOption: 2, // C
        explanation: "The import statement simply allows an accessible type to be referenced by its simple name instead of writing its fully qualified name."
    }
];

// App State
let state = {
    candidateName: localStorage.getItem("candidateName") || "",
    category: "ALL",
    questions: [],
    currentQuestionIndex: 0,
    userAnswers: {},
    attemptNumber: parseInt(localStorage.getItem("attemptNumber") || "1"),
    lastScore: localStorage.getItem("lastScore") !== null ? parseInt(localStorage.getItem("lastScore")) : null,
    lastTotal: localStorage.getItem("lastTotal") !== null ? parseInt(localStorage.getItem("lastTotal")) : null
};

function init() {
    renderStartScreen();
}

function renderStartScreen() {
    const app = document.getElementById("app");

    let lastRecordHtml = "";
    if (state.lastScore !== null && state.lastTotal !== null) {
        const pct = Math.round((state.lastScore / state.lastTotal) * 100);
        const status = pct >= 60 ? "PASSED" : "NEEDS IMPROVEMENT";
        lastRecordHtml = `
            <div class="banner banner-previous">
                <div class="banner-title">Previous Assessment Record Found</div>
                <p>
                    Candidate: <strong>${escapeHtml(state.candidateName || "Student")}</strong> | 
                    Last Marks: <strong>${state.lastScore} / ${state.lastTotal}</strong> (${pct}%) - 
                    <strong>[ ${status} ]</strong>
                </p>
                <p style="margin-top: 6px; font-size: 13px;">
                    You can retry the assessment below to test your knowledge again.
                </p>
            </div>
        `;
    }

    app.innerHTML = `
        <div class="header">
            <h1>Online Quiz System</h1>
            <p>Database: <strong>java_question_bank</strong> | Table: <strong>mcq_questions</strong> (25 Questions)</p>
        </div>

        ${lastRecordHtml}

        <div class="banner banner-info">
            <div class="banner-title">Assessment Guidelines</div>
            <p>- Contains <strong>25 Multiple Choice Questions</strong> on Java Packages, synchronized with table <code>mcq_questions</code>.</p>
            <p>- <strong>One question is presented at a time</strong>. Click <strong>Next Question &rarr;</strong> to proceed.</p>
            <p>- You can jump to any question directly using the Question Navigator buttons (1 - 25).</p>
            <p>- Each question carries 1 mark. Passing score is 60% (15/25).</p>
        </div>

        <form id="startForm">
            <div class="form-group">
                <label for="candidateName">Candidate Full Name:</label>
                <input type="text" id="candidateName" class="form-control" value="${escapeHtml(state.candidateName)}" placeholder="Enter your full name" required autofocus>
            </div>

            <div class="form-group">
                <label for="category">Assessment Module:</label>
                <select id="category" class="form-control">
                    <option value="ALL">Java Question Bank - Complete 25 MCQs (Java Packages)</option>
                </select>
            </div>

            <div style="margin-top: 25px;">
                <button type="submit" class="btn btn-primary btn-block">Start Assessment</button>
            </div>
        </form>

        <div class="footer">
            <p>Online Quiz Management System | Step-by-Step Test Engine</p>
        </div>
    `;

    document.getElementById("startForm").addEventListener("submit", function(e) {
        e.preventDefault();
        const nameInput = document.getElementById("candidateName").value.trim();
        state.candidateName = nameInput || "Student";
        localStorage.setItem("candidateName", state.candidateName);
        startQuiz();
    });
}

function startQuiz() {
    state.questions = [...ALL_QUESTIONS];
    state.currentQuestionIndex = 0;
    state.userAnswers = {};
    renderQuizScreen();
}

function renderQuizScreen() {
    const app = document.getElementById("app");
    const totalQ = state.questions.length;
    const currentIdx = state.currentQuestionIndex;
    const currentQ = state.questions[currentIdx];
    const letters = ["A", "B", "C", "D"];

    let attemptedCount = 0;
    state.questions.forEach(q => {
        if (state.userAnswers[q.id] !== undefined) {
            attemptedCount++;
        }
    });

    const isCurrentAttempted = state.userAnswers[currentQ.id] !== undefined;
    const currentSelection = isCurrentAttempted ? state.userAnswers[currentQ.id] : -1;
    const progressPct = Math.round(((currentIdx + 1) / totalQ) * 100);

    let paletteHtml = "";
    state.questions.forEach((q, idx) => {
        const isAnswered = state.userAnswers[q.id] !== undefined;
        const isActive = idx === currentIdx;
        let classes = "palette-btn";
        if (isAnswered) classes += " answered";
        if (isActive) classes += " active";

        paletteHtml += `
            <button type="button" class="${classes}" onclick="jumpToQuestion(${idx})" title="Go to Question ${idx + 1}${isAnswered ? ' (Answered)' : ''}">
                ${idx + 1}
            </button>
        `;
    });

    let snippetHtml = "";
    if (currentQ.codeSnippet && currentQ.codeSnippet.trim().length > 0) {
        snippetHtml = `<pre class="code-snippet">${escapeHtml(currentQ.codeSnippet)}</pre>`;
    }

    let optionsHtml = "";
    currentQ.options.forEach((opt, optIdx) => {
        const isSelected = currentSelection === optIdx;
        const radioId = `opt_${currentQ.id}_${optIdx}`;
        optionsHtml += `
            <label class="option-item ${isSelected ? 'selected' : ''}" for="${radioId}">
                <input type="radio" id="${radioId}" name="current_question_option" value="${optIdx}" ${isSelected ? 'checked' : ''} onchange="selectOption(${currentQ.id}, ${optIdx})">
                <span class="option-text">
                    <span class="option-letter">${letters[optIdx]}.</span>
                    ${escapeHtml(opt)}
                </span>
            </label>
        `;
    });

    let lastMarksBar = "";
    if (state.lastScore !== null && state.lastTotal !== null) {
        lastMarksBar = `<div class="meta-item" style="color: #744210;">Previous Marks: <strong>${state.lastScore} / ${state.lastTotal}</strong></div>`;
    }

    const isFirstQuestion = currentIdx === 0;
    const isLastQuestion = currentIdx === totalQ - 1;

    app.innerHTML = `
        <div class="header">
            <h1>Online Quiz Assessment</h1>
            <p>Database: <strong>java_question_bank</strong> | Table: <strong>mcq_questions</strong></p>
        </div>

        <div class="meta-bar">
            <div class="meta-item">Candidate: <strong>${escapeHtml(state.candidateName)}</strong></div>
            <div class="meta-item">Question: <strong>${currentIdx + 1} of ${totalQ}</strong></div>
            <div class="meta-item">Answered: <strong>${attemptedCount} / ${totalQ}</strong></div>
            <div class="meta-item">Attempt: <strong>#${state.attemptNumber}</strong></div>
            ${lastMarksBar}
        </div>

        <!-- Progress Bar -->
        <div class="progress-container" title="Progress: ${progressPct}%">
            <div class="progress-fill" style="width: ${progressPct}%;"></div>
        </div>

        <!-- Question Palette Jump Grid -->
        <div class="palette-wrapper">
            <div class="palette-header">
                <span>Question Navigator (Click number to jump):</span>
                <span>${attemptedCount} of ${totalQ} Answered</span>
            </div>
            <div class="question-palette">
                ${paletteHtml}
            </div>
            <div class="palette-legend">
                <span class="legend-item"><span class="legend-dot current"></span> Current (${currentIdx + 1})</span>
                <span class="legend-item"><span class="legend-dot answered"></span> Answered</span>
                <span class="legend-item"><span class="legend-dot unanswered"></span> Unanswered</span>
            </div>
        </div>

        <!-- Active Question Card -->
        <div class="question-card">
            <div class="question-header">
                <div>
                    <span class="question-number">Question ${currentIdx + 1} of ${totalQ}</span>
                    <span style="margin-left: 10px;">
                        ${isCurrentAttempted ? 
                            '<span class="question-summary-badge status-badge-answered">Answered</span>' : 
                            '<span class="question-summary-badge status-badge-unanswered">Not Answered Yet</span>'}
                    </span>
                </div>
                <span class="topic-badge">${currentQ.topic}</span>
            </div>

            <div class="question-text">${escapeHtml(currentQ.questionText)}</div>
            ${snippetHtml}

            <div class="options-list">
                ${optionsHtml}
            </div>

            <div style="margin-top: 12px; display: flex; justify-content: space-between; align-items: center;">
                <span class="clear-link" onclick="clearCurrentSelection(${currentQ.id})">Clear answer for this question</span>
                <span style="font-size: 12px; color: #718096;">Select an option, then click Next</span>
            </div>
        </div>

        <!-- Navigation Buttons: Previous / Next / Submit -->
        <div class="quiz-nav-bar">
            <div class="quiz-nav-left">
                <button type="button" class="btn btn-outline" onclick="prevQuestion()" ${isFirstQuestion ? 'disabled' : ''}>
                    &larr; Previous Question
                </button>
            </div>

            <div class="quiz-nav-right">
                ${!isLastQuestion ? `
                    <button type="button" class="btn btn-primary" onclick="nextQuestion()">
                        Next Question &rarr;
                    </button>
                ` : `
                    <button type="button" class="btn btn-primary" style="background-color: #2e7d32; border-color: #2e7d32;" onclick="confirmAndSubmit()">
                        Finish & Submit Assessment &check;
                    </button>
                `}
                
                <button type="button" class="btn btn-secondary" onclick="confirmAndSubmit()">
                    Submit Assessment (${attemptedCount}/${totalQ})
                </button>

                <button type="button" class="btn btn-outline" onclick="cancelQuiz()">
                    Cancel
                </button>
            </div>
        </div>

        <div class="footer">
            <p>Online Quiz Management System | One Question at a Time Mode</p>
        </div>
    `;
}

window.selectOption = function(questionId, optionIndex) {
    state.userAnswers[questionId] = optionIndex;
    renderQuizScreen();
};

window.clearCurrentSelection = function(questionId) {
    delete state.userAnswers[questionId];
    renderQuizScreen();
};

window.nextQuestion = function() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
        state.currentQuestionIndex++;
        renderQuizScreen();
        window.scrollTo({ top: 120, behavior: 'smooth' });
    }
};

window.prevQuestion = function() {
    if (state.currentQuestionIndex > 0) {
        state.currentQuestionIndex--;
        renderQuizScreen();
        window.scrollTo({ top: 120, behavior: 'smooth' });
    }
};

window.jumpToQuestion = function(index) {
    if (index >= 0 && index < state.questions.length) {
        state.currentQuestionIndex = index;
        renderQuizScreen();
        window.scrollTo({ top: 120, behavior: 'smooth' });
    }
};

window.cancelQuiz = function() {
    if (confirm("Exit quiz without submitting? Current progress will be lost.")) {
        renderStartScreen();
    }
};

window.confirmAndSubmit = function() {
    const totalQ = state.questions.length;
    let answeredCount = 0;
    state.questions.forEach(q => {
        if (state.userAnswers[q.id] !== undefined) {
            answeredCount++;
        }
    });

    const unansweredCount = totalQ - answeredCount;
    let message = `You have answered ${answeredCount} of ${totalQ} questions.`;
    if (unansweredCount > 0) {
        message += `\nWarning: ${unansweredCount} question(s) are still unanswered.`;
    }
    message += "\n\nAre you sure you want to finish and submit your assessment?";

    if (confirm(message)) {
        evaluateQuiz();
    }
};

function evaluateQuiz() {
    let correctCount = 0;
    let wrongCount = 0;
    let unattemptedCount = 0;
    const reviews = [];

    state.questions.forEach(q => {
        const selected = state.userAnswers[q.id] !== undefined ? state.userAnswers[q.id] : -1;
        const isAttempted = selected >= 0;
        const isCorrect = isAttempted && (selected === q.correctOption);

        if (!isAttempted) {
            unattemptedCount++;
        } else if (isCorrect) {
            correctCount++;
        } else {
            wrongCount++;
        }

        reviews.push({
            question: q,
            selected: selected,
            isAttempted: isAttempted,
            isCorrect: isCorrect
        });
    });

    const total = state.questions.length;
    const score = correctCount;
    const percentage = total > 0 ? Math.round((score / total) * 1000) / 10 : 0;
    const status = percentage >= 60 ? "PASSED" : "NEEDS IMPROVEMENT";

    const prevScore = state.lastScore;
    const prevTotal = state.lastTotal;

    state.lastScore = score;
    state.lastTotal = total;
    localStorage.setItem("lastScore", score);
    localStorage.setItem("lastTotal", total);

    renderResultScreen({
        score,
        total,
        percentage,
        status,
        correctCount,
        wrongCount,
        unattemptedCount,
        prevScore,
        prevTotal,
        reviews
    });
}

function renderResultScreen(res) {
    const app = document.getElementById("app");
    const letters = ["A", "B", "C", "D"];

    let comparisonHtml = "";
    if (res.prevScore !== null && res.prevTotal !== null) {
        const prevPct = Math.round((res.prevScore / res.prevTotal) * 100);
        const diff = res.score - res.prevScore;
        let diffText = "";
        if (diff > 0) {
            diffText = `<strong style="color: #22543d;">+${diff} marks (Improvement achieved!)</strong>`;
        } else if (diff < 0) {
            diffText = `<strong style="color: #742a2a;">${diff} marks</strong>`;
        } else {
            diffText = `<strong>0 marks (Consistent score)</strong>`;
        }

        comparisonHtml = `
            <div class="comparison-box">
                <h4>Score Comparison with Last Attempt:</h4>
                <p>Previous Attempt Marks: <strong>${res.prevScore} / ${res.prevTotal}</strong> (${prevPct}%)</p>
                <p>Current Attempt Marks: <strong>${res.score} / ${res.total}</strong> (${res.percentage}%)</p>
                <p style="margin-top: 6px;">Score Difference: ${diffText}</p>
            </div>
        `;
    }

    let statusBadge = "";
    if (res.status === "PASSED") {
        statusBadge = `<span class="status-badge status-passed">[ PASSED - QUALIFIED ]</span>`;
    } else {
        statusBadge = `<span class="status-badge status-failed">[ NEEDS IMPROVEMENT - RETRY RECOMMENDED ]</span>`;
    }

    let reviewsHtml = "";
    res.reviews.forEach((rev, idx) => {
        const q = rev.question;
        let cardClass = "review-card ";
        let tagClass = "review-tag ";
        let statusLabel = "";

        if (!rev.isAttempted) {
            cardClass += "review-unattempted";
            tagClass += "tag-unattempted";
            statusLabel = "[ Not Attempted ]";
        } else if (rev.isCorrect) {
            cardClass += "review-correct";
            tagClass += "tag-correct";
            statusLabel = "[ Correct ]";
        } else {
            cardClass += "review-wrong";
            tagClass += "tag-wrong";
            statusLabel = "[ Incorrect ]";
        }

        let yourSelectionText = "";
        if (!rev.isAttempted) {
            yourSelectionText = `<span style="color: #718096;">None (Question skipped)</span>`;
        } else {
            const color = rev.isCorrect ? "#22543d" : "#742a2a";
            yourSelectionText = `<span style="color: ${color};">${letters[rev.selected]}. ${escapeHtml(q.options[rev.selected])}</span>`;
        }

        let snippetReview = "";
        if (q.codeSnippet && q.codeSnippet.trim().length > 0) {
            snippetReview = `<pre class="code-snippet">${escapeHtml(q.codeSnippet)}</pre>`;
        }

        reviewsHtml += `
            <div class="${cardClass}">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
                    <span style="font-size: 13px; font-weight: 700; color: #4a5568;">Question ${idx + 1} (${q.topic})</span>
                    <span class="${tagClass}">${statusLabel}</span>
                </div>
                <div style="font-weight: 600; font-size: 15px; margin-bottom: 10px; color: #1a202c;">
                    ${escapeHtml(q.questionText)}
                </div>
                ${snippetReview}
                <div class="review-answer-line">
                    Your Selection: <strong>${yourSelectionText}</strong>
                </div>
                <div class="review-answer-line">
                    Correct Answer: <strong style="color: #22543d;">${letters[q.correctOption]}. ${escapeHtml(q.options[q.correctOption])}</strong>
                </div>
                <div class="review-explanation">
                    <strong>Explanation:</strong> ${escapeHtml(q.explanation)}
                </div>
            </div>
        `;
    });

    app.innerHTML = `
        <div class="header">
            <h1>Assessment Report</h1>
            <p>Database: <strong>java_question_bank</strong> | Table: <strong>mcq_questions</strong></p>
        </div>

        <div class="meta-bar">
            <div class="meta-item">Candidate: <strong>${escapeHtml(state.candidateName)}</strong></div>
            <div class="meta-item">Module: <strong>Java Packages</strong></div>
            <div class="meta-item">Attempt: <strong>#${state.attemptNumber}</strong></div>
        </div>

        <div class="score-card">
            <div style="font-size: 14px; text-transform: uppercase; color: #718096; font-weight: 700; letter-spacing: 0.5px;">
                Final Score
            </div>
            <div class="score-display">
                ${res.score} / ${res.total}
            </div>
            <div class="percentage-display">
                Percentage: <strong>${res.percentage}%</strong>
            </div>

            <div>${statusBadge}</div>
            ${comparisonHtml}
        </div>

        <div class="stats-grid">
            <div class="stat-box">
                <div class="stat-label">Correct Answers</div>
                <div class="stat-value" style="color: #2e7d32;">${res.correctCount}</div>
            </div>
            <div class="stat-box">
                <div class="stat-label">Incorrect Answers</div>
                <div class="stat-value" style="color: #c62828;">${res.wrongCount}</div>
            </div>
            <div class="stat-box">
                <div class="stat-label">Unattempted</div>
                <div class="stat-value" style="color: #616161;">${res.unattemptedCount}</div>
            </div>
        </div>

        <div class="btn-group" style="margin-bottom: 30px;">
            <button class="btn btn-primary" style="flex: 2; font-size: 15px; padding: 12px 20px;" onclick="retryQuiz()">
                Retry Quiz (Retake Assessment with Previous Score Saved)
            </button>
            <button class="btn btn-secondary" style="flex: 1; font-size: 15px; padding: 12px 20px;" onclick="renderStartScreen()">
                Back to Home
            </button>
        </div>

        <div style="margin-top: 30px;">
            <h3 style="font-size: 18px; margin-bottom: 15px; border-bottom: 2px solid #e2e8f0; padding-bottom: 8px;">
                Detailed Answer Key & Concept Explanations
            </h3>
            ${reviewsHtml}
        </div>

        <div class="btn-group" style="margin-top: 25px;">
            <button class="btn btn-primary" style="flex: 2;" onclick="retryQuiz()">Retry Quiz</button>
            <button class="btn btn-outline" style="flex: 1;" onclick="renderStartScreen()">Back to Home</button>
        </div>

        <div class="footer">
            <p>Online Quiz Management System | Java Packages Technical Assessment</p>
        </div>
    `;

    window.scrollTo({ top: 0, behavior: 'smooth' });
}

window.retryQuiz = function() {
    state.attemptNumber++;
    localStorage.setItem("attemptNumber", state.attemptNumber);
    state.currentQuestionIndex = 0;
    state.userAnswers = {};
    renderQuizScreen();
};

function escapeHtml(text) {
    if (!text) return "";
    return text
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

document.addEventListener("DOMContentLoaded", init);
