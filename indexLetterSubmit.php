<?php
require './connection.php';

if (isset($_POST["submitLetter"])) {
    $description = $_POST["description"];
    $letterContent = $_POST["letter"];
    $date = $_POST["date"];
    $phoneNumber = $_POST["mobileNum"];
    $email = $_POST["emailAddress"];
    $unic = $_POST["uniquecode"];

    // Combine letter content and description
    $fullNameContent = "Letter Date: " . $date . "\n\n" . $letterContent . "\n\nSummary: " . $description;

    $selectUnic = "SELECT * FROM `systemadmin` WHERE 1";
    $resultUnic = $conn->query($selectUnic);

    $selectemail = "SELECT * FROM `contactUser` WHERE 1";
    $resultemail = $conn->query($selectemail);

    if ($resultUnic->num_rows > 0) {
        $authorized = false;
        while ($row = $resultUnic->fetch_assoc()) {
            if ($unic == $row["uniqueCode"]) {
                $authorized = true;
                break;
            }
        }

        if ($authorized) {
            $emailAuthorized = false;
            if ($resultemail->num_rows > 0) {
                while ($rows = $resultemail->fetch_assoc()) {
                    if ($email == $rows["email"]) {
                        $emailAuthorized = true;
                        break;
                    }
                }
            }

            if ($emailAuthorized) {
                // For a typed letter, we use a placeholder or summary 
                // We'll save the description in the 'name' column and reuse the logic.
                // We'll use a marker in the 'image' column to indicate it's a typed letter.
                $marker = "LETTER_RECORD_" . uniqid();
                
                // We'll also save the full letter text into the 'name' column if it fits, 
                // or just keep it as description.
                $dbName = mysqli_real_escape_string($conn, $description);
                $dbLetter = mysqli_real_escape_string($conn, $letterContent);
                $combined = $dbName . " [Letter Content: " . $dbLetter . "]";

                $query = "INSERT INTO tb_upload(id,name,image,Approval,Decline,email,phonenumber) VALUES('', '$combined', '$marker','OFF','OFF','$email','$phoneNumber')";
                if (mysqli_query($conn, $query)) {
                    echo "<script>
                            alert('Letter sent successfully');
                            window.location.href = './index.php';
                          </script>";
                } else {
                    echo "<script> alert('Database error: Could not insert letter.'); window.location.href = './index.php';</script>";
                }
            } else {
                echo "<script>
                        alert('Un-authorized email!!!');
                        window.location.href = 'index.php';
                      </script>";
                exit();
            }
        } else {
            echo "<script>
                    alert('Invalid Unique Code, Please try again!!!');
                    window.location.href = 'index.php';
                  </script>";
            exit();
        }
    } else {
        echo "<script>
                alert('System is updating, Please try later!!!');
                window.location.href = 'index.php';
              </script>";
        exit();
    }
}
?>
