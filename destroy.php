<?php

$conn = new mysqli("localhost", "root", "paramore", "shc");


/**
* Obtiene las tablas de la bd
*
* @param conn $conn conexion a la bd
*
* @return array de tablas
*/
function getTables($conn)
{
    $sql = "SELECT table_name 
              FROM information_schema.tables 
             WHERE table_schema = 'shc';";
    $result = $conn->query($sql);
    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row["table_name"];
    }
    return $data;
}

/**
* Obtiene el comando para crear el modelo en ruby
*
* @param conn  $conn  conexion a la bd
* @param table $table tabla en base de datos
*
* @return string
*/
function getCommand($conn, $table)
{
    $sql = "SELECT column_name, data_type 
              FROM information_schema.COLUMNS 
             WHERE table_schema = 'shc' 
               AND table_name = '$table'";
    $result = $conn->query($sql);
    $data = [];
    while ($row = $result->fetch_assoc()) {
        switch($row["data_type"]) {
        case "varchar":
        case "text":
            $data[] = "$row[column_name]:string";
            break;
        case "tinyint":
        case "bigint":
            $data[] = "$row[column_name]:integer";
            break;
        default:
            $data[] = "$row[column_name]:$row[data_type]";
            break;
        }
    }
    return "rails destroy scaffold $table " . implode(" ", $data) . "\n";
}

$tables = getTables($conn);
foreach ($tables as $table) {
    exec(getCommand($conn, $table));
}