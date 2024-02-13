<?php
require "header.php";
require "dbh.inc.php";

// Check if the user profile exists in the database
$sql = "SELECT * FROM userprofiles WHERE UserID=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $_SESSION["userId"]);
$stmt->execute();
$result = $stmt->get_result();
$profileData = $result->fetch_assoc();

// If the user profile doesn't exist, create a new one
if (!$profileData) {
    // Check if the form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Process the form data
        $firstName = $_POST['firstName'];
        $lastName = $_POST['lastName'];
        $dateOfBirth = $_POST['dateOfBirth'];
        $avatar = ''; // Placeholder for avatar
        $bio = $_POST['bio'];

        // Handle avatar file upload
        if ($_FILES['avatar']['error'] == 0) {
            $avatarName = $_FILES['avatar']['name'];
            $avatarTmpName = $_FILES['avatar']['tmp_name'];
            $avatarPath = "uploads/" . $avatarName;
            move_uploaded_file($avatarTmpName, $avatarPath);
            $avatar = $avatarPath;
        }

        // Insert the new profile data into the database
        $sql = "INSERT INTO userprofiles (UserID, FirstName, LastName, DateOfBirth, Avatar, Bio) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("isssss", $_SESSION["userId"], $firstName, $lastName, $dateOfBirth, $avatar, $bio);
        $stmt->execute();

        // Redirect to the profile page after insertion
        header("Location: profile.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;  
            background: rgb(222,222,222);
            background: linear-gradient(90deg, rgba(222,222,222,1) 0%, rgba(255,255,255,1) 50%, rgba(167,166,165,1) 100%);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 90px;
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
        .profile {
            margin-bottom: 20px;
        }
        .profile p {
            margin-bottom: 10   px;
        }
        .profile p strong {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Profile</h1>
        <?php if ($profileData) : ?>
            <div class="profile">
                <img src="<?php echo $profileData['Avatar']; ?>" alt="Profile Picture">
                <p><strong>First Name:</strong> <?php echo $profileData['FirstName']; ?></p>
                <p><strong>Last Name:</strong> <?php echo $profileData['LastName']; ?></p>
                <p><strong>Date of Birth:</strong> <?php echo $profileData['DateOfBirth']; ?></p>
                <p><strong>Bio:</strong> <?php echo $profileData['Bio']; ?></p>
            </div>
        <?php else : ?>
            <div class="profile-form">
                <form method="post" enctype="multipart/form-data">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required><br>
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required><br>
                    <label for="dateOfBirth">Date of Birth:</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" required><br>
                    <label for="avatar">Profile Picture:</label>
                    <input type="file" id="avatar" name="avatar" accept="image/*" required><br>
                    <label for="bio">Bio:</label><br>
                    <textarea id="bio" name="bio" rows="4" cols="50" required></textarea><br>
                    <button type="submit">Create Profile</button>
                </form>
            </div>
        <?php endif; ?>
    </div>
</body>
</html>
