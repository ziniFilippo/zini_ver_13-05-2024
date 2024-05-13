<?php
    include "./connection.php";
    $codice_polizza = (int)$_GET['codice_tipo_polizza'];

    $qry = "SELECT * 
    FROM ASSICURATO INNER JOIN
    (ASSICURATORE INNER JOIN PREMIO ON ASSICURATORE.ID = ASSICURATORE_ID)
    ON ASSICURATO.ID = ASSICURATO_ID
    WHERE POLIZZA_ID = ?";
    $stmt = $conn->prepare($qry);
    $stmt->bind_param("i", $codice_polizza);
    $stmt->execute();
    echo $stmt->get_result();
?>