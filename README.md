# Online Quiz Management System
**Java Packages Technical Assessment Portal**

---

### Project Overview
A complete, lightweight, human-crafted Dynamic Web Project built for Eclipse and Apache Tomcat, as well as static deployment (Vercel / GitHub Pages). It provides an assessment containing 25 curated multiple choice questions testing Java Packages, import mechanics, access modifiers, compilation with `-d`, and classpath execution.

---

### Key Features
1. **Curated Technical Questions (Java Packages - 25 Questions)**:
   - **Package Basics & Namespace**: Package definitions, package keywords, placement at top of file, `java.lang` automatic import, naming conventions.
   - **Import Statements & Mechanics**: Specific imports, wildcard `.*` non-recursive behavior, fully qualified names vs simple names.
   - **Access Modifiers & Visibility**: `public`, `protected`, default (package-private), `private` across package boundaries and subclasses.
   - **Compilation & Execution**: `javac -d .` automatic folder hierarchy creation, execution via fully qualified name `java college.Student`, subpackage independence (`java.util` vs `java.util.concurrent`).

2. **One-Question-at-a-Time Navigation**:
   - Clean, focused interface displaying **one question at a time**.
   - **Next Question** button to proceed smoothly to the next question.
   - **Previous Question** button to review or change earlier answers.
   - **Question Jump Palette (1 - 25)**: interactive grid allowing instant jumping to any question, color-coded by Answered, Current, and Unanswered status.
   - **Live Progress Bar**: tracks progress percentage as the user moves through the assessment.

3. **Last Marks & Score Tracking**:
   - Displays the candidate's score, percentage, and qualification status (`PASSED` at 60%+, or `NEEDS IMPROVEMENT`).
   - Stores and compares previous attempt marks against the current attempt (`+X marks improvement`).
   - Provides an itemized breakdown of Correct, Incorrect, and Unattempted questions.

4. **Retry Option**:
   - A dedicated **Retry Quiz** button on the results page.
   - Resets questions for a clean attempt while preserving and displaying the last scored marks.
   - Retakes test one-by-one to reinforce learning.

5. **Detailed Answer Review & Concept Explanations**:
   - Displays all 25 questions with the candidate's chosen answer vs. the correct answer.
   - Provides in-depth explanations for why the correct option is right.

6. **Simple, Human-Made UI**:
   - Clean, purposeful design crafted with pure semantic HTML and CSS.
   - No external icon packs (no FontAwesome, no SVG clutter, no emojis in buttons).
   - Fully self-contained: requires no external CDNs or internet access to render cleanly.

---

### How to Run in Eclipse

1. **Open Eclipse**:
   - Launch Eclipse IDE for Enterprise Java and Web Developers (or Eclipse IDE with WTP).

2. **Import Project**:
   - Click `File` -> `Import...`
   - Select `General` -> `Existing Projects into Workspace` -> Click `Next`.
   - Set **Select root directory** to:
     ```
     C:\Users\user\Desktop\Kruthi\iv\SN_2026\Online Quiz Management
     ```
   - Make sure **Online Quiz Management** is checked -> Click `Finish`.

3. **Run on Apache Tomcat**:
   - In the `Project Explorer`, right-click on the project **Online Quiz Management** (or right-click `src/main/webapp/index.jsp`).
   - Click `Run As` -> `Run on Server`.
   - Select your configured Apache Tomcat server (Tomcat 8.5 / 9 / 10).
   - Click `Finish`.

4. **Access in Browser**:
   - Open your web browser to:
     ```
     http://localhost:8080/Online_Quiz_Management/
     ```

---

### Project File Structure
```
Online Quiz Management/
├── .classpath
├── .project
├── .settings/
│   ├── org.eclipse.jdt.core.prefs
│   ├── org.eclipse.wst.common.component
│   └── org.eclipse.wst.common.project.facet.core.xml
├── src/
│   └── main/
│       ├── java/
│       │   └── com/quiz/
│       │       ├── model/
│       │       │   ├── Question.java
│       │       │   ├── QuestionReview.java
│       │       │   └── QuizResult.java
│       │       └── service/
│       │           └── QuizRepository.java
│       └── webapp/
│           ├── css/
│           │   └── style.css
│           ├── WEB-INF/
│           │   ├── classes/
│           │   └── web.xml
│           ├── index.jsp
│           ├── startQuiz.jsp
│           ├── quiz.jsp
│           ├── submitQuiz.jsp
│           ├── result.jsp
│           └── retry.jsp
└── README.md
```
