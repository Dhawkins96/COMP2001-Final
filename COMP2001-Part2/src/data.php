<!DOCTYPE html>
<html>
<head>

   <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>

<div class="header">
    <h1>Crime Data</h1>
    <p>A website for the crime rate in Plymouth, UK from 2003 - 2015</p>
</div>

<div class="topnav">
    <a href="index.php">Home</a>
    <a href="data.php">Crime Data</a>

</div>

<div class="row">
    <div class="leftcolumn">
        <div class="card">
            <h2>The table below shows the crime rates in Plymouth, UK from the years of 2003 till 2015</h2>
            <h5>This is in a human readable format, if you would like a machine readable version - <a href="Crime.php">Crime JSON Markup</a> <br/></h5>

            <?php

            $filename = "CrimeDataPlymouth.csv";

            echo "<html><body><table>\n\n";

            if (file_exists($filename)) {
                $f = fopen($filename, "r");
                while (($line = fgetcsv($f)) !== false) {
                    echo "<tr>";
                    foreach ($line as $cell) {
                        echo "<td>" . htmlspecialchars($cell) . "</td>";
                    }
                    echo "</tr>\n";
                }
                fclose($f);
            }

            else{ echo "<tr><td>No file exists! </td></tr>" ;}
            echo "\n</table></body></html>";
            ?>
        </div>
    </div>
</div>
<div class="footer">
    <h5>Copyright © 2020 School of Engineering, Computing & Mathematics with University of Plymouth. All rights reserved.</h5>
</div>

</body>
</html>