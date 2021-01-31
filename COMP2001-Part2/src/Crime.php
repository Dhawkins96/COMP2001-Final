<?php

    $file_data = file_get_contents($fileName = "CrimeDataPlymouth.csv");
    $file = fopen($fileName, "r");
    $column_name = array();
    $final_data = array();

            while (($data = fgetcsv($file, 0, ",")) !== FALSE) {
            $data_array = array_map("str_getcsv", explode("\n", $file_data));
            $labels = array_shift($data_array);

            foreach($labels as $label)
            {
                $column_name[] = $label;

            }
            $count = count($data_array) - 1;
            for($j = 0; $j < $count; $j++)
            {
                $data = array_combine($column_name, $data_array[$j]);

                $final_data[$j] = $data;
            }
            function set_url( $url )
                {
                    echo("<script>history.replaceState({},'','$url');</script>");
                }
            set_url("http://localhost:63342/COMP2001-Part2/public/Crime.php");

            echo json_encode($final_data);
            exit;
    }


