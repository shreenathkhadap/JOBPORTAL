<?php
require('connection.php');
session_start();
if (empty($_SESSION['username']) || ($_SESSION['type'] != 'stud')) {
    header("Location: index.php");
}
$main_user = $_SESSION['username'];


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Category</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!-- Bootstrap icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <!-- Custom css -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <!-- page -->
    <link rel="stylesheet" href="./assets/css/candidate-appliedjobs.css">
    <!-- <link rel="stylesheet" href="./assets/css/candidate-dashboard.css"> -->


    <!-- Jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
    <!-- navbar  -->
    <?php include './profileNavbar.php'; ?>

    <div id="button-side-nav-bar" class="">

    </div>
    <section>

        <div class="row w-100">
            <?php
            $activePage = 'bookmarkedjobs';
            include './candidate-sidenavbar.php';
            ?>


            <div class="col">

                <h4 class="my-5 fw-normal">
                    Saved Jobs:
                </h4>

                <div class="table-responsive rounded">



                    <table id="dashboard-table" class="w-100 ">
                        <thead style="background-color: var(--primary); color: white; ">
                            <tr>
                                <td class="p-3 text-start" scope="col">Job Tittle</td>
                                <!-- <td scope="col">Apply Date</td> -->
                                <td scope="col">Company</td>
                                <td scope="col">Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php


                            // Now you can use the $category value in your query
                            $query2 = "SELECT book.*, job.* 
                            FROM bookmark AS book 
                            INNER JOIN jobs AS job ON book.jobid = job.jobid  
                            WHERE book.username = '$main_user'                            
                            LIMIT 6";


                            // $query = "SELECT * FROM `appliedjobs` WHERE username = '$main_user'";

                            if ($result2 = mysqli_query($con, $query2)) {
                                if (mysqli_num_rows($result2) > 0) {
                                    while ($row2 = mysqli_fetch_assoc($result2)) { ?>


                                        <tr>
                                            <td>
                                                <div class="row mb-3 m-2">
                                                    <!-- <div class="col-auto">
<img class="rounded-5" height="37px" width="37px" src="companydocs/." alt="" srcset="">
</div> -->
                                                    <div class="col-auto w-75">

                                                        <div class="row  w-100">
                                                            <div class="col-auto fw-semibold text-start w-70 ">
                                                                <?php echo $row2['jobtitle']; ?>---
                                                                <?php echo $row2['bookmarkid']; ?>
                                                            </div>
                                                            <!-- <div class="col-auto text-secondary d-flex w-30 justify-content-end" style="font-size: 14px;">
    1 days ago
</div> -->
                                                        </div>
                                                        <div class="row text-secondary  w-100 text-start" style="font-size: 14px;">
                                                            <div class="col-auto w-40">
                                                                <?php echo $row2['location2']; ?>
                                                            </div>
                                                            <div class="col-auto d-flex w-60 justify-content-end">
                                                                Salary: <span class="text-black fw-semibold"><?php echo $row2['minsalary']; ?>-<?php echo $row2['maxsalary']; ?> </span> /Month

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <!-- <td>
                                                
                                            </td> -->
                                            <td>
                                                <?php echo $row2['compname'] ?>
                                            </td>
                                            <td>
                                                <a href="job-details.php?id=<?php echo $row2['jobid']; ?>" class="apply-now-link">Apply Now</a>
                                            </td>
                                        </tr>

                            <?php
                                    }
                                } else {
                                    echo "No matching records found.";
                                }
                            }
                            ?>
                        </tbody>
                    </table>

                </div>
            </div>

    </section>
    <!-- footer -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <?php include './footer.php'; ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="assets/js/job-details.js"></script>
</body>

</html>