<?php 
include "dbh.inc.php";
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baybayin Quiz</title>
    <style>
        body {
    font-family: 'Noto Sans Baybayin', sans-serif;
    background: url('images/') no-repeat, linear-gradient(90deg, rgba(222,222,222,1) 0%, rgba(255,255,255,1) 50%, rgba(167,166,165,1) 100%);
    background-size: 30% 40%, cover;
    background-position: left, center;
    background-color: #f8f8f8; /* Fallback color */
    margin: 0;
    padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }

    .question-container {
        margin-bottom: 20px;
    }

    .question-container.active {
        display: block; /* Display active question container */
    }

    .option {
        margin-bottom: 10px;
        cursor: pointer;
    }

    .droppable {
        border: 2px dashed #aaa;
        min-height: 50px;
        margin-top: 10px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative; /* Position for underline */
    }

    .underline {
        width: 100%;
        height: 2px;
        background-color: #000;
        position: absolute;
        bottom: -2px; /* Position at bottom of droppable */
    }

    .option:hover {
        background-color: #f0f0f0;
    }

    .options-container {
        display: flex;
        justify-content: space-between;
    }

    .option-box {
        width: 20%;
        text-align: center;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
    }

    .submit-btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        display: block;
        margin: 0 auto;
    }

    .submit-btn:hover {
        background-color: #0056b3;
    }
    .back-link {
            position: absolute;
            top: 20px; /* Adjust the top position as needed */
            left: 20px; /* Adjust the left position as needed */
            padding: 5px 10px; /* Add padding for better visibility and clickability */
            background-color: #007bff; /* Add background color for better visibility */
            color: #fff; /* Set text color to white */
            text-decoration: none; /* Remove underline */
            border-radius: 5px; /* Add border radius for rounded corners */
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Baybayin Quiz</h2>
    <form id="quizForm">
    <img src="../images/baybayin_A.svg">
    <?php
// Fetch questions for Quiz 1 only
$sql = "SELECT * FROM quizzes WHERE QuizID = 1"; // Assuming Quiz 1 corresponds to Lesson 1
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $question_number = 1;
    while ($row = $result->fetch_assoc()) {
        $question = $row['QuizQuestion'];
        $options = array($row['Option1'], $row['Option2'], $row['Option3'], $row['Option4']);
        $correct_answer = $row['CorrectAnswer']; // Retrieve correct answer for each question
        
        echo "<div class='question-container' id='question{$question_number}'>";
        echo "<p>{$question_number}. {$question}</p>";
        
        echo "<div class='droppable' id='droppable{$question_number}' ondrop='drop(event, {$question_number})' ondragover='allowDrop(event)'><div class='underline'></div></div>";
        echo "<div class='options-container'>";
        foreach ($options as $key => $option) {
            echo "<div class='option-box' draggable='true' ondragstart='drag(event)' id='option{$question_number}_{$key}' data-value='{$option}'>{$option}</div>";
        }
        echo "</div>";
        
        // Add hidden input for correct answer
        echo "<input type='hidden' id='correctAnswer{$question_number}' value='{$correct_answer}'>";
    
        echo "</div>";
    
        // Increment question number
        $question_number++;
    }
    
} else {
        echo "No quiz questions available.";
    }

    $conn->close();
    ?>
        <input type="submit" class="submit-btn" value="Submit Quiz">
    </form>

      <a href="lesson.php" class="back-link">Back to Lessons</a> <!-- Change div to anchor tag -->
</div>

<script>
    // Initialize variables to keep track of correct answers and total questions
    var correctAnswers = 0;
    var totalQuestions = <?php echo $question_number - 1; ?>; // Get total number of questions from PHP

    // Show the first question
    document.getElementById('question1').classList.add('active');

    function allowDrop(ev) {
        ev.preventDefault();
    }

    function drag(ev) {
        ev.dataTransfer.setData("text", ev.target.id);
        // Set the data-value attribute as well
        ev.dataTransfer.setData("value", ev.target.getAttribute("data-value"));
    }

    function drop(ev, questionNumber) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        var value = ev.dataTransfer.getData("value"); // Retrieve the data-value attribute
        var option = document.getElementById(data);
        var droppable = document.getElementById('droppable' + questionNumber);
        droppable.innerText = value;
        droppable.style.backgroundColor = "#e9e9e9";
    }

    document.getElementById("quizForm").addEventListener("submit", function(e) {
        e.preventDefault(); // Prevent form submission

        var incorrectAnswers = [];

        // Iterate over all questions
        for (var i = 1; i <= totalQuestions; i++) {
            // Get user answer
            var userAnswer = document.getElementById("droppable" + i).innerText.trim();

            // Retrieve correct answer dynamically for the active question
            var correctAnswerInput = document.getElementById("correctAnswer" + i);
            var correctAnswer = correctAnswerInput.value;

            // Compare user answer to correct answer
            if (userAnswer === correctAnswer) {
                correctAnswers++; // Increment correct answers count
            } else {
                // Store details of incorrect answer
                incorrectAnswers.push({
                    question: document.getElementById('question' + i).querySelector('p').innerText,
                    userAnswer: userAnswer,
                    correctAnswer: correctAnswer
                });
            }
        }

        // Calculate score
        var score = (correctAnswers / totalQuestions) * 100;

        // Display score and incorrect answers details
        var message = "Quiz completed!\nYour score: " + score.toFixed(2) + "%";
        if (incorrectAnswers.length > 0) {
            message += "\n\nIncorrect answers:";
            incorrectAnswers.forEach(function(answer) {
                message += "\nQuestion: " + answer.question;
                message += "\nYour answer: " + answer.userAnswer;
                message += "\nCorrect answer: " + answer.correctAnswer + "\n";
            });
        }
        alert(message);
        // You can redirect to another page or perform other actions here
    });

    // Function to show correct answers for questions answered incorrectly
    function showCorrectAnswers() {
        var incorrectQuestions = document.querySelectorAll('.question-container');
        incorrectQuestions.forEach(function(question) {
            question.querySelector('.droppable').innerText = question.querySelector('#correctAnswer' + question.id.slice(8)).value;
        });
    }
</script>

</body>
</html>
