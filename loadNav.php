<?php

function getNavH() {
    echo @file_get_contents('.\html\navHead.html');
}
function getNavF() {
    echo @file_get_contents('.\html\navFoot.html');
}

?>
