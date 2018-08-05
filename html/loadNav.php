<?php

function getNavH() {
    echo @file_get_contents('.\navHead.html');
}
function getNavF() {
    echo @file_get_contents('.\navFoot.html');
}

?>
