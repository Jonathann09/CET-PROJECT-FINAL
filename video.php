<?php
require "header.php";
?>

<?php
// Get the lesson ID from the URL parameter
$lesson_id = isset($_GET['id']) ? $_GET['id'] : null;

// Map lesson IDs to corresponding video file names
$video_files = array(
    1 => 'lesson1.mp4',
    2 => 'lesson2.mp4',
    3 => 'lesson3.mp4',
    4 => 'lesson4.mp4',
    5 => 'lesson5.mp4'
);

// Map lesson IDs to corresponding course descriptions and teachers
$lesson_info = array(
    1 => array(
        'description' => 'Baybayin is one of the pre-colonial ancient writing scripts of the Philippines. At the end of this class, you will be able to answer the quiz provided. This class is open to ages 14 and older and must be able to understand Filipino. ',
        'teacher' => 'Christian Nathaniel Simple'
    ),
    2 => array(
        'description' => 'Baybayin is one of the pre-colonial ancient writing scripts of the Philippines. At the end of this class, you will be able to answer the quiz provided. This class is open to ages 14 and older and must be able to understand Filipino. ',
        'teacher' => 'Christian Nathaniel Simple'
    ),
    3 => array(
        'description' => 'Baybayin is one of the pre-colonial ancient writing scripts of the Philippines. At the end of this class, you will be able to answer the quiz provided. This class is open to ages 14 and older and must be able to understand Filipino. ',
        'teacher' => 'Christian Nathaniel Simple'
    ),
    4 => array(
        'description' => 'Baybayin is one of the pre-colonial ancient writing scripts of the Philippines. At the end of this class, you will be able to answer the quiz provided. This class is open to ages 14 and older and must be able to understand Filipino. ',
        'teacher' => 'Christian Nathaniel Simple'
    )
);

// Check if the lesson ID is valid and exists in the $video_files array
if ($lesson_id && isset($video_files[$lesson_id])) {
    // Get the video file name based on the lesson ID
    $video_file = $video_files[$lesson_id];
    // Get the course description and teacher based on the lesson ID
    $course_description = $lesson_info[$lesson_id]['description'];
    $teacher = $lesson_info[$lesson_id]['teacher'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Lesson</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .back-link {
            display: block;
            margin-bottom: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .video-container {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%; /* 16:9 aspect ratio */
            margin-bottom: 20px;
            overflow: hidden;
        }

        .video-container video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .course-info {
            margin-bottom: 20px;
        }

        .course-info p {
            margin: 10px 0;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 10px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lesson <?php echo $lesson_id; ?> Video</h1>

        <!-- Back link -->
        <a href="lesson.php" class="back-link">Back to Lessons</a>

        <!-- Course description and teacher -->
        <div class="course-info">
            <p><strong>Course Description:</strong> <?php echo $course_description; ?></p>
            <p><strong>Teacher:</strong> <?php echo $teacher; ?></p>
        </div>

        <!-- Video container -->
        <div class="video-container">
            <video controls>
                <source src="videos/<?php echo $video_file; ?>" type="video/mp4">
            </video>
        </div>
    </div>
</body>
</html>

<?php
} else {
    // If the lesson ID is invalid or not found, display an error message
    echo '<p>Invalid lesson ID or video not found.</p>';
}
?>
