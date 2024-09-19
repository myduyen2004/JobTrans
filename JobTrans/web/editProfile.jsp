<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="css/newcss.css"> <!-- Link to your CSS file -->
    <style>
        /* Basic styling for the form */
    </style>
</head>

<body>
    <div class="container">
        <!-- Edit Profile Section -->
        <form action="edit" method="post" enctype="multipart/form-data">
            <div class="dashboard-box">
                <div class="headline">
                    <h3><i class="icon-material-outline-account-circle"></i> Edit My Profile</h3>
                </div>
                <div class="row">
                    <!-- Avatar and User Info -->
                    <div class="col-auto">
                        <div class="avatar-wrapper">
                            <img class="profile-pic" src="${User.avatarUrl != null ? User.avatarUrl : 'images/user-avatar-placeholder.png'}" alt="Profile Picture">
                            <div class="upload-button" title="Change Avatar">+</div>
                            <input class="file-upload" type="file" name="avatar" accept="image/*">
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="submit-field">
                            <h5>User Name</h5>
                            <input type="text" name="user_name" value="${User.userName}" required>
                        </div>
                    </div>

                    

                    <div class="col-xl-6">
                        <div class="submit-field">
                            <h5>Specification</h5>
                            <!-- Upload file input for Specification -->
                            <input type="file" name="specification" accept=".pdf,.doc,.docx,.txt">
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="submit-field">
                            <h5>Address</h5>
                            <input type="text" name="address" value="${User.address}">
                        </div>
                    </div>

                    <div class="col-xl-12">
                        <div class="submit-field">
                            <h5>Introduce Yourself</h5>
                            <textarea name="description" rows="4">${User.description}</textarea>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="row">
                <div class="col-xl-6">
                    <button type="submit" class="button ripple-effect">Save Changes</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>