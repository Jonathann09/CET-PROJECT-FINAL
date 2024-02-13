<?php
// Include the header
require "header.php";

// Sample data of lessons (we can fetch this from our database)
$lessons = array(
    array("id" => 1,  "description" => "Baybayin Lesson 1", "Quiz level" => "Easy" ),
    array("id" => 2,  "description" => "Baybayin Lesson 2", "Quiz level" => "Moderate"),
    array("id" => 3,  "description" => "Baybayin Lesson 3", "Quiz level" => "Hard"),
    array("id" => 4,  "description" => "Baybayin Lesson 4", "Quiz level" => "Very Hard"),

);
?>

<h1>Baybayin Lessons</h1>

<style>
  body {
    font-family: Arial, sans-serif;
    background-image: url('images/bg-img5.jpg');
    background-size: 100% 215%; /* Ensure the background image covers the entire viewport */
    background-position: center; /* Center the background image */
    background-repeat: no-repeat; /* Prevent the background image from repeating */
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

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f2f2f2;
    }

    td a {
        color: #007bff;
        text-decoration: none;
    }

    td a:hover {
        text-decoration: underline;
    }

    .quiz-button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
    }

    .quiz-button:hover {
        background-color: #0056b3;
    }

    /* Popup styles */
    .popup {
        position: relative;
        display: inline-block;
        cursor: pointer;
    }

    .popup-content {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #f9f9f9;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    z-index: 1;
    padding: 10px;
    border-radius: 4px;
    width: 90%; /* Adjust the width as needed */
    max-width: 600px; /* Maximum width for larger screens */
    height: 90vh; /* 90% of the viewport height */
}

    .popup:hover .popup-content {
        display: block;
    }

.popup-content video {
    width: 100%;
    height: 100%;
    object-fit: contain; /* Ensure the video fills the container */
}
</style>

<table>
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Video</th> <!-- New column for the video link -->
        <th>Take Quiz</th>
        <th>Quiz level</th> 

    </tr>
    <?php foreach ($lessons as $lesson): ?>
    <tr>
        <td><?php echo $lesson['id']; ?></td>
        <td><?php echo $lesson['description']; ?></td>
        <td><a href="video.php?id=<?php echo $lesson['id']; ?>">Watch Video</a></td> <!-- Link to the video page -->
        <td><button class="quiz-button" onclick="location.href='quiz<?php echo $lesson['id']; ?>.php'">Quiz <?php echo $lesson['id']; ?></button></td> <!-- Button to the specific quiz file with onclick event -->
        <td><?php echo $lesson['Quiz level']; ?></td>
    </tr>
<?php endforeach; ?>


</table>
